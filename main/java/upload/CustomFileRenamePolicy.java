package upload;

import java.io.File;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CustomFileRenamePolicy extends DefaultFileRenamePolicy {

    @Override
    public File rename(File file) {
        String parentDir = file.getParent();
        String newName = "uploaded_image.jpg";
        
        return new File(parentDir, newName);
    }
}
