//Welcome response stub
var WelcomeStubResponse = {
	"speech": "Welcome to Opus. My name is Vega. I am designed to help you with your remittance needs. You can say Estimate Fee or Find an agent",
	"displayText": "Welcome to Opus. My name is Vega. I am designed to help you with your remittance needs. You can say Estimate Fee or Find an agent",
	"source": "Opus-NLP"
}

var ListOfAppointments = {
	"Date":"10-Feb-2018",
    "Doctor": "Dr. Prakash Rasal",
    "appointments": [
        { "patient_name":"Henry Ford", "time": "11:00", "appointment_type":"Eye Exam", "PIN_code": 411028},
        { "patient_name":"Daimler Chrysler", "time": "11:30", "appointment_type":"Cataract", "PIN_code": 411028},
        { "patient_name":"Elon Musk", "time": "12:00", "appointment_type":"Eye accident", "PIN_code": 411028}
    ]

}



//exporting all stubs
exports.WelcomeStubResponse = WelcomeStubResponse;
exports.ListOfAppointments = ListOfAppointments;
