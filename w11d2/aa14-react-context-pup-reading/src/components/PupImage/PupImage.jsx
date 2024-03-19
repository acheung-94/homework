import speedy from '../../pups/speedy-pup.jpg';
import banana from '../../pups/banana-pup.jpg';
import sleepy from '../../pups/sleepy-pup.jpg';
import { PupContext } from '../../context/PupContext';
import { usePuppyType } from '../../context/PupContext';
const PupImage = () => {
  const {puppyType} = usePuppyType(PupContext)
  return (
    <img src={puppyType} alt="pup" />
  );
};

export default PupImage;
