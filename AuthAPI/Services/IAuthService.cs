using AuthAPI.Dtos;
using AuthAPI.Entities;

namespace AuthAPI.Services
{
    public interface IAuthService
    {
        Task<User?> Register(UserForRegisterDto userForRegisterDto);
        Task<string?> Login(UserForLoginDto userForLoginDto);
        Task<bool> VerifyEmail(string token);
        Task<bool> ResendVerificationEmail(string email);
        Task<bool> ForgotPassword(string email);
        Task<bool> ResetPassword(string token, string newPassword);
        Task<object> GetUserDebugInfo(string email); // Debug metodu
        Task<object> GetAllUsersDebugInfo(); // Debug metodu
        Task<EmailStatusResponseDto> CheckEmailStatus(string email); // Yeni metod
        
        // Yeni hesap silme metodları
        Task<bool> DeleteUserAccount(string email, string password);
        Task<bool> DeleteUserAccountByAdmin(string email);
        Task<string> GenerateAccountDeletionToken(string email);
        Task<bool> ConfirmAccountDeletion(string token);
    }
}