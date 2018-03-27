
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongsnumbere the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.create(email: "johndoe@cashoo.com") # OlivR note: populating password requires to fix bcrypt issue 
t1 = Userstat.create(available: "23450", revenue: "7490", wealth: "134550",user_id: "90000",job_id: "0")
t2 = Userstat.create(available: "0", revenue: "0", wealth: "0",user_id: "99999",job_id: "0")

# "title","monthsalary"
t20 = Job.create(title:"Vendeur",monthsalary:"1500")
t21 = Job.create(title:"Chauffeur VTC",monthsalary:"1600")
t22 = Job.create(title:"Cuisinier",monthsalary:"1600")
t23 = Job.create(title:"Marinier",monthsalary:"1800")
t24 = Job.create(title:"Infirmier",monthsalary:"2100")
t25 = Job.create(title:"Kynésithérapeute",monthsalary:"2900")
t26 = Job.create(title:"Enseignant à l'université",monthsalary:"3100")
t27 = Job.create(title:"Développeur Full Stack",monthsalary:"3200")
t28 = Job.create(title:"Designer d'application web",monthsalary:"3500")
t29 = Job.create(title:"Community Manager",monthsalary:"3800")
t30 = Job.create(title:"Consultant Big Data",monthsalary:"5600")
t31 = Job.create(title:"Chirurgien Dentiste",monthsalary:"8000")

# "number","title","color","asset_number","amount","ratio","assetmove","message","edu"
# t100 = Event.create(number:"10",title:"Carte bancaire ",color:"g",asset_number:"1",amount:"-100",ratio:"100",assetmove:"",
# 	message:"Vous avez atteint la limite autorisée pour le paiement sans contact de votre CB.",
# 	edu:"Idée : la limite de paiement sans contact peut s'utiliser comme un outil d'épargne personnelle. Je m'autorise à dépenser une somme maximum par semaine. Après, mes loisirs c'est un livre et des pâtes jusqu'à la prochaine rentrée d'argent")
# t101 = Event.create(number:"20",title:"Ecologie",color:"op",asset_number:"9000",amount:"0",ratio:"100",assetmove:"buy",
# 	message:"L'état a mis en place une prime pour l'achat d'un vélo électrique. Voulez-vous acheter un vélo électrique ?",
# 	edu:"Acheter un vélo électrique diminue votre budget carburant. Et le vélo c'est très bon pour la santé.")
# t102 = Event.create(number:"30",title:"Ecologie",color:"op",asset_number:"3000",amount:"0",ratio:"100",assetmove:"buy",
# 	message:"L'état a mis en place une prime pour l'achat d'un vélo électrique. Voulez-vous acheter un  magasin de vélos ?",
# 	edu:"")
# t103 = Event.create(number:"40",title:"Ecologie",color:"op",asset_number:"3000",amount:"0",ratio:"115",assetmove:"inc",
# 	message:"L'état a mis en place une prime pour l'achat d'un vélo électrique. Votre magasin de vélos augmente sa profitabilité de 15%",
# 	edu:"")

# "number","name","extra","category","subcategory","value","profitrate","creditrate","feerate","taxrate","TaxOnSellProfitRate"
# t999 = Asset.create(number:"1",name:"Compte courant",extra:"LBDT (La Banque De Tous)",category:"Account",subcategory:"",value:"0",
# 	profitrate:"0",creditrate:"0",feerate:"0",taxrate:"0",TaxOnSellProfitRate:"0")
# t1000 = Asset.create(number:"1000",name:"Livret d'épargne ",extra:"LBDT (La Banque De Tous)",category:"Account",subcategory:"",value:"0",
# 	profitrate:"1.2",creditrate:"0",feerate:"0",taxrate:"0",TaxOnSellProfitRate:"0")
# t3000 = Asset.create(number:"3000",name:"Magasin de vélo",extra:"",category:"Business",subcategory:"",value:"43000",
# 	profitrate:"15",creditrate:"8",feerate:"0",taxrate:"0",TaxOnSellProfitRate:"0")
# t9000 = Asset.create(number:"9000",name:"Vélo électrique",extra:"",category:"Life",subcategory:"",value:"-1800",
# 	profitrate:"0",creditrate:"0",feerate:"0",taxrate:"0",TaxOnSellProfitRate:"0")