import path from 'path';
import multer from 'multer';

class Helpers {
  static checkFileType(file, cb) {
    const filetypes = /jpeg|jpg|png|gif/;
    const extname = filetypes.test(path.extname(file.originalname).toLowerCase());
    const mimetype = filetypes.test(file.mimetype);
  
    if (mimetype && extname) {
      return cb(null, true)
    } else {
      cb('Error: Images only')
    }
  }
}

//Set Storage Engine
Helpers.storage = multer.diskStorage({
  destination: 'public/images/',
  filename: (req, file, cb) => {
    cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
  }
});

//Init upload
Helpers.upload = multer({
  storage: Helpers.storage,
  fileFilter: (req, file, cb) => {
    Helpers.checkFileType(file, cb)
  }
}).single('image');

export default Helpers;