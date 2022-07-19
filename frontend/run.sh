robot -l none -o none -r none tasks/Delorean.robot
pabot -x xunit.xml -d ./logs -v BROWSER:chromium -v HEADLESS:true -e smoke_test tests/

rm -rf ./logs/browser
mkdir ./logs/browser
mkdir ./logs/browser/screenshot

cp $(find ./logs/pabot_results -type f -name "*.png") ./logs/browser/screenshot/
