package it.pleaseopen.keycloak.auth.gameboy;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.stream.IntStream;

import org.jboss.logging.Logger;
import org.keycloak.authentication.AuthenticationFlowContext;
import org.keycloak.authentication.AuthenticationFlowError;
import org.keycloak.authentication.Authenticator;
import org.keycloak.events.Errors;
import org.keycloak.forms.login.LoginFormsProvider;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.RealmModel;
import org.keycloak.models.UserModel;
import org.keycloak.models.utils.FormMessage;
import org.keycloak.services.messages.Messages;

import com.google.common.primitives.UnsignedBytes;

import org.keycloak.authentication.authenticators.browser.AbstractUsernameFormAuthenticator;

import jakarta.ws.rs.core.MultivaluedMap;
import jakarta.ws.rs.core.Response;

public class GameboyAuthenticatorForm extends AbstractUsernameFormAuthenticator implements Authenticator {

    static final String ID = "demo-gameboy-code-form";

    public static final String GAMEBOY_CODE = "gameboyCode";

    private final KeycloakSession session;

    private final Logger log = Logger.getLogger(GameboyAuthenticatorForm.class);

    /*
     * #define J_UP 0x04U
     * #define J_DOWN 0x08U
     * #define J_LEFT 0x02U
     * #define J_RIGHT 0x01U
     * #define J_A 0x10U
     * #define J_B 0x20U
     * #define J_SELECT 0x40U
     * #define J_START 0x80U
     */
    private final List<Integer> gbkeys = Arrays.asList(0x04, 0x08, 0x01, 0x02, 0x10, 0x20);

    private final List<Integer> sharedSecret = Arrays.asList(3, 202, 128, 74, 86, 206, 237, 73, 251, 4, 131, 48, 2, 228,
            108, 159, 141, 138, 137, 7, 165, 241, 81, 142, 29, 183, 81, 143, 96, 176, 29, 7, 96, 215, 27, 30, 146, 138,
            138, 197, 193, 248, 56, 208, 151, 210, 12, 48, 227, 10, 237, 109, 183, 184, 104, 102, 117, 83, 75, 19, 113,
            236, 38, 147, 100, 28, 162, 195, 17, 91, 136, 94, 241, 86, 174,
            219, 145, 237, 33, 74, 106, 132, 199, 92, 82, 182, 158, 127, 172, 252, 53, 111, 154, 228, 248, 60, 216, 121,
            59, 11, 126, 29, 171, 60, 146, 29, 1, 186, 249, 242, 108, 104,
            228, 44, 65, 231, 66, 108, 25, 77, 232, 1, 112, 81, 123, 164, 4, 207, 181, 221, 110, 73, 60, 93, 238, 103,
            235, 135, 177, 58, 165, 205, 67, 211, 116, 171, 68, 116, 127, 85,
            165, 173, 150, 240, 199, 198, 77, 58, 134, 116, 205, 228, 164, 219, 229, 177, 251, 70, 1, 191, 53, 220, 251,
            50, 154, 188, 99, 235, 91, 35, 180, 4, 115, 167, 111, 142, 13,
            49, 7, 218, 47, 226, 246, 39, 127, 30, 57, 112, 244, 239, 66, 193, 106, 96, 53, 0, 239, 240, 4, 177, 85, 69,
            93, 106, 82, 232, 238, 77, 189, 225, 81, 204, 203, 253, 168,
            45, 125, 132, 85, 14, 44, 74, 213, 217, 132, 24, 47, 38, 195, 213, 188, 8, 201, 150, 224, 251, 43, 218, 58,
            106, 34, 49, 167, 55, 96, 191, 41, 140, 70, 31, 163, 173, 191,
            188, 49, 142, 157, 178, 163, 60, 187, 68, 95, 185, 232, 72, 172, 21, 209, 191, 119, 72, 3, 177, 109, 153,
            210, 37, 103, 102, 158, 33, 180, 21, 131, 244, 27, 102, 156, 109,
            154, 200, 174, 173, 101, 211, 119, 79, 74, 5, 124, 122, 109, 9, 249, 196, 120, 241, 107, 30, 141, 102, 46,
            146, 65, 88, 147, 199, 178, 185, 110, 196, 217, 153, 192, 83, 89,
            187, 31, 13, 9, 120, 38, 63, 138, 133, 179, 248, 183, 45, 68, 181, 131, 36, 14, 78, 173, 244, 90, 35, 196,
            71, 49, 35, 123, 96, 129, 231, 169, 25, 54, 194, 202, 67, 42, 159,
            8, 76, 93, 156, 50, 205, 213, 209, 204, 163, 235, 115, 162, 24, 222, 187, 129, 62, 107, 42, 160, 46, 215,
            85, 53, 159, 136, 185, 113, 41, 60, 174, 205, 17, 36, 192, 242, 92,
            146, 102, 182, 73, 211, 113, 148, 17, 95, 10, 166, 17, 19, 131, 26, 231, 58, 116, 55, 210, 75, 49, 40, 55,
            253, 184, 144, 255, 158, 251, 102, 237, 239, 199, 104, 233, 108, 127,
            111, 191, 41, 96, 67, 17, 249, 143, 214, 247, 38, 205, 251, 139, 238, 79, 62, 193, 67, 198, 5, 255, 52, 183,
            160, 244, 121, 148, 233, 132, 138, 134, 14, 60, 125, 27, 148, 200,
            109, 188, 126, 46, 93, 26, 48, 19, 248, 163, 220, 55, 2, 252, 194, 215, 161, 83, 52, 145, 119, 58);

    Random rand = new Random();

    public GameboyAuthenticatorForm(KeycloakSession session) {
        this.session = session;
    }

    @Override
    public void authenticate(AuthenticationFlowContext context) {
        challenge(context, null);
    }

    @Override
    protected Response challenge(AuthenticationFlowContext context, String error, String field) {
        LoginFormsProvider form = context.form().setExecution(context.getExecution().getId());

        if (error != null) {
            if (field != null) {
                form.addError(new FormMessage(field, error));
            } else {
                form.setError(error);
            }
        }

        // generate challenge
        ArrayList<Integer> challengeValue = new ArrayList<>();
        int challengeLength = 10;

        for (int i = 0; i < challengeLength; i++) {
            int randomIndex = rand.nextInt(gbkeys.size());
            challengeValue.add(gbkeys.get(randomIndex));
        }

        // Testing fixed combination
        /*
         * challengeValue.add(0x08); // DOWN
         * challengeValue.add(0x01); // RIGHT
         * challengeValue.add(0x10); // A
         * challengeValue.add(0x04); // UP
         * challengeValue.add(0x01); // RIGHT
         * challengeValue.add(0x04); // UP
         * challengeValue.add(0x04); // UP
         * challengeValue.add(0x08); // DOWN
         * challengeValue.add(0x10); // A
         * challengeValue.add(0x02); // LEFT
         */

        // generate wanted response
        List<Integer> hash = Arrays.asList(0, 0, 0);
        Integer index = 0;

        do {
            Integer newValue = hash.get(index % 3) ^ (sharedSecret.get(index) ^ challengeValue.get(index % 10));

            /*
             * log.debug("index: " + Integer.toString(index, 16) + " newvalue: " +
             * Integer.toString(newValue, 16));
             * log.debug("hash: " + Integer.toString(hash.get(index % 3), 16)
             * + " secret: " + Integer.toString(sharedSecret.get(index), 16)
             * + " challenge: " + challengeValue.get(index % 10));
             */
            hash.set(index % 3, newValue);
        } while (++index < 512);

        context.getAuthenticationSession().setAuthNote(GAMEBOY_CODE, Integer.toString(hash.get(0), 16)
                + Integer.toString(hash.get(1), 16)
                + Integer.toString(hash.get(2), 16));

        // Showing wanted hash in log for testing and demonstration purpose, never do
        // that kind of things in production
        log.info("Wanted hash: " + context.getAuthenticationSession().getAuthNote(GAMEBOY_CODE));

        // Set challenge to form to show to the user and save response
        for (int i = 0; i < 10; ++i) {
            form.setAttribute("challenge" + i, Integer.toString(challengeValue.get(i), 16));
        }

        Response response = form.createForm("gameboy-code-form.ftl");
        context.challenge(response);
        return response;
    }

    @Override
    public void action(AuthenticationFlowContext context) {
        UserModel userModel = context.getUser();
        if (!enabledUser(context, userModel)) {
            // error in context is set in enabledUser/isDisabledByBruteForce
            return;
        }

        MultivaluedMap<String, String> formData = context.getHttpRequest().getDecodedFormParameters();

        boolean valid;
        try {
            int givenGameboyCode = Integer.parseInt(formData.getFirst(GAMEBOY_CODE), 16);
            valid = validateCode(context, givenGameboyCode);
        } catch (NumberFormatException e) {
            valid = false;
        }

        if (!valid) {
            context.getEvent().user(userModel).error(Errors.INVALID_USER_CREDENTIALS);
            Response challengeResponse = challenge(context, Messages.INVALID_ACCESS_CODE);
            context.failureChallenge(AuthenticationFlowError.INVALID_CREDENTIALS, challengeResponse);
            return;
        }

        resetGameboyCode(context);
        context.success();
    }

    @Override
    protected String disabledByBruteForceError() {
        return Messages.INVALID_ACCESS_CODE;
    }

    private void resetGameboyCode(AuthenticationFlowContext context) {
        context.getAuthenticationSession().removeAuthNote(GAMEBOY_CODE);
    }

    private boolean validateCode(AuthenticationFlowContext context, int givenCode) {
        int gbCode = Integer.parseInt(context.getAuthenticationSession().getAuthNote(GAMEBOY_CODE), 16);
        return givenCode == gbCode;
    }

    @Override
    public boolean requiresUser() {
        return true;
    }

    @Override
    public boolean configuredFor(KeycloakSession session, RealmModel realm, UserModel user) {
        return true;
    }

    @Override
    public void setRequiredActions(KeycloakSession session, RealmModel realm, UserModel user) {
        // NOOP
    }

    @Override
    public void close() {
        // NOOP
    }
}
