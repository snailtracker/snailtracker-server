NotificationType.where({name: "error"}).first_or_create
NotificationType.where({name: "warning"}).first_or_create
NotificationType.where({name: "info"}).first_or_create
NotificationType.where({name: "debug"}).first_or_create
