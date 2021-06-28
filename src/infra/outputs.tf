output "service_account_private_key" {
  value       = google_service_account_key.insane_svc_key.private_key
  sensitive   = true
  description = "Google svc account private key"
}
