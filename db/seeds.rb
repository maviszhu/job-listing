# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(email:"admin@126.com", password:"123456", password_confirmation:"123456", is_admin: true, company:"下一站科技")
# User.create(email:"test@123.com", password:"123456", password_confirmation:"123456", is_admin: false, company:"遇见未来公司")

Job.create(title:"测试工程师", content:"帮助找出bug。 越多越好！", wage_min:3000 ,wage_max:10000 ,contact:"non@non.com", is_hidden:false, location:"南京",user_id: 7)
Job.create(title:"系统架构师", content:"软件界的建筑师。等你来打造杰出产品。", wage_min:10000 ,wage_max:30000 ,contact:"non@non.com", is_hidden:false, location:"北京",user_id: 7)
Job.create(title:"产品总监", content:"管理团队 管控产品进程", wage_min:20000 ,wage_max:60000 ,contact:"non@non.com", is_hidden:false, location:"南京",user_id: 6)
Job.create(title:"产品经理", content:"代码、设计、测试、销售、市场、管理…… 这些你都要统统hold住", wage_min:2000 ,wage_max:20000 ,contact:"non@non.com", is_hidden:false, location:"上海",user_id: 6)
Job.create(title:"Java高级工程师", content:"有至少2个项目经验 良好的编程习惯", wage_min:10000 ,wage_max:30000 ,contact:"non@non.com", is_hidden:false, location:"上海",user_id: 6)
