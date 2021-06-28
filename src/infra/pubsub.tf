resource "google_pubsub_topic" "insane_topic_k" {
  name   = "insane-topic-k"
  labels = local.labels
}

resource "google_pubsub_subscription" "insane_sub_k" {
  name   = "insane-sub-k"
  topic  = google_pubsub_topic.insane_topic_k.name
  labels = local.labels
}