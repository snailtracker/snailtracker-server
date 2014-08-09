LogType.where({name: "error"}).first_or_create
LogType.where({name: "warning"}).first_or_create
LogType.where({name: "info"}).first_or_create
LogType.where({name: "debug"}).first_or_create
