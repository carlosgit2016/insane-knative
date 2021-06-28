resource "google_service_account" "insane_svc_acc_k" {
  account_id   = "insane-svc-knative"
  display_name = "Insase svc account Knative"
  description  = "Permission to Knative services operations"
}

resource "google_service_account_key" "insane_svc_key" {
  service_account_id = google_service_account.insane_svc_acc_k.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

# A role, which is a named collection of permissions that provide the ability to perform actions on Google Cloud resources.
resource "google_project_iam_custom_role" "insane_role_publish" {
  role_id     = "insaneRolePublish"
  title       = "Insane Knative role to publisher"
  description = "Permission to publish to a topic"
  permissions = [
    "pubsub.topics.publish"
  ]
}

resource "google_project_iam_custom_role" "insane_role_subscribe" {
  role_id     = "insaneRoleSubscribe"
  title       = "Insane Knative role to subscriber"
  description = "Permission to subscribe to a topic"
  permissions = [
    "pubsub.subscriptions.consume"
  ]
}

# Generates an IAM policy document
data "google_iam_policy" "insane_publish" {

  # IAM Role binding
  binding {
    role = google_project_iam_custom_role.insane_role_publish.name
    # can be a user account, service account, Google group, or domain.
    # 1,500 members. Up to 250 of these members can be Google groups
    members = [
      "serviceAccount:${google_service_account.insane_svc_acc_k.email}"
    ]
  }
}

data "google_iam_policy" "insane_subscribe" {
  binding {
    role = google_project_iam_custom_role.insane_role_subscribe.name
    members = [
      "serviceAccount:${google_service_account.insane_svc_acc_k.email}"
    ]
  }
}

resource "google_pubsub_topic_iam_policy" "publisher" {
  topic       = google_pubsub_topic.insane_topic_k.id
  policy_data = data.google_iam_policy.insane_publish.policy_data
}

resource "google_pubsub_subscription_iam_policy" "consume" {
  subscription = google_pubsub_subscription.insane_sub_k.id
  policy_data  = data.google_iam_policy.insane_subscribe.policy_data
}