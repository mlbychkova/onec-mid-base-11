#Область ПрограммныйИнтерфейс

Процедура ДополнитьФорму(Форма) Экспорт
	
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда 
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		ДобавитьГруппаСкидкаВГруппаШапкаЛево(Форма);
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда 
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда 
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда 
		ВставитьПолеКонтактноеЛицоНаФормуПередОснование(Форма, Форма.Элементы.Основание);
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда 
		ВставитьПолеКонтактноеЛицоНаФормуПередОснование(Форма, Форма.Элементы.СуммаДокумента);
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

Процедура ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма)
	
	ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДЗР_КонтактноеЛицо";

КонецПроцедуры

Процедура ДобавитьГруппаСкидкаВГруппаШапкаЛево(Форма)
	
	ГруппаСкидка = Форма.Элементы.Добавить("ГруппаСкидка", Тип("ГруппаФормы"), Форма.Элементы.ГруппаШапкаЛево);
	ГруппаСкидка.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаСкидка.Отображение = ОтображениеОбычнойГруппы.Нет;
	ГруппаСкидка.Группировка = ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяЕслиВозможно;
	ГруппаСкидка.ОтображатьЗаголовок = Ложь;
	
	ПолеВвода = Форма.Элементы.Добавить("СогласованнаяСкидка", Тип("ПолеФормы"), Форма.Элементы.ГруппаСкидка);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДЗР_СогласованнаяСкидка";
	ПолеВвода.УстановитьДействие("ПриИзменении", "ДЗР_СогласованнаяСкидкаПриИзменении");
	
	Команда = Форма.Команды.Добавить("ПересчитатьСкидку");
	Команда.Заголовок = "Пересчитать таблицу";
	Команда.Действие = "ДЗР_ПересчитатьСкидку";	
	КнопкаФормы = Форма.Элементы.Добавить("ПересчитатьТаблицу", Тип("КнопкаФормы"), Форма.Элементы.ГруппаСкидка);		
	КнопкаФормы.ИмяКоманды = "ПересчитатьСкидку";
	КнопкаФормы.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	КнопкаФормы.Отображение = ОтображениеКнопки.КартинкаИТекст;
	КнопкаФормы.Картинка = БиблиотекаКартинок.Обновить;
	
КонецПроцедуры

Процедура ВставитьПолеКонтактноеЛицоНаФормуПередОснование(Форма, Поле)
	
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Поле);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДЗР_КонтактноеЛицо";

КонецПроцедуры

#КонецОбласти
