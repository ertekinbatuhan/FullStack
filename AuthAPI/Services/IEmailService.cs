namespace AuthAPI.Services
{
    public interface IEmailService
    {
        Task SendEmailVerificationAsync(string email, string verificationToken);
        Task SendPasswordResetAsync(string email, string resetToken);
        Task SendAccountDeletionConfirmationAsync(string email, string deletionToken);
        Task SendAccountDeletedNotificationAsync(string email);
    }
}