output "rds_endpoint" {
  description = "RDS MySQL instance connection endpoint (host:port)"
  value       = aws_db_instance.vpro_rds_instance.endpoint
}

output "memcached_configuration_endpoint" {
  description = "Memcached cluster configuration endpoint (host:port) - use this in app config"
  value       = aws_elasticache_cluster.vpro_cache_instance.configuration_endpoint
}

output "rabbitmq_endpoints" {
  description = "RabbitMQ broker AMQP/console endpoints for all instances"
  value       = aws_mq_broker.vpro-rm-instance.instances[*].endpoints
}