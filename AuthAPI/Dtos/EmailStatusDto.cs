using System.ComponentModel.DataAnnotations;

namespace AuthAPI.Dtos
{
    public class EmailStatusDto
    {
        [Required(ErrorMessage = "Email is required.")]
        [EmailAddress(ErrorMessage = "Please enter a valid email address.")]
        public string Email { get; set; } = string.Empty;
    }
    
    public class EmailStatusResponseDto
    {
        public string Email { get; set; } = string.Empty;
        public bool IsRegistered { get; set; }
        public bool IsEmailVerified { get; set; }
        public string Status { get; set; } = string.Empty;
        public string Message { get; set; } = string.Empty;
        public DateTime? RegistrationDate { get; set; }
    }
}