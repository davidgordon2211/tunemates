import "bootstrap";

import 'select2/dist/css/select2.css';

import { initSelect2 } from '../components/init_select2';
import { placeholderSelect2 } from '../components/init_select2';

initSelect2();
placeholderSelect2();

import '../components/confettis';

import { vh } from '../components/vhHeight';

vh();

import { turnActive } from '../components/guess-choice';
import { categories } from '../components/guess-choice';

turnActive(categories);


