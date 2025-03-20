#  Reminders List UIKit

Reminders app - приложение заметки на UIKit

## Section 1 
- creating project in Xcode

## Section 2 Add collection view controller
    1.Добавим ViewController к StoryBoard. ViewController служит связующим звеном между View и моделями данных. Каждый ViewController отвечает за управление иерархией View, обновление содержимого во View и реагирование на события в пользовательском интерфейсе.
    Будем использовать Interface Builder для создания CollectionViewController. В CollectionViewController могут отображаться ячейки в виде сеток, таблиц, столбцов, строк и т.д.
    
    Выбираем файл Main.storyboard и в появимшемся окне в левой панели(Document outline) удалим  View Controller Scene. Click on View Controller Scene and push Backspace button on keyboard.
    2. Добавим CollectionViewController взамен удаленного
    3. Перетаскиванием добавляем CollectionViewController на canvas
    4. Раскроем( in document outline) CollectinoViewController и удалим collection view cell
    5. В Document outline выбираем CollectionViewController -> в правой верхней части экрана выберем Attributes inspector -> поставить галочку в поле Is initial view controller
    
## Section 3: Create reminder model
    В этом приложении будет использованна структура(архитектура) MVC - Model View Controller
    1. Создадим новую папку Models
    (В Xcode 16 появилось дополнение, теперь в Project Navigator можно создавать как папки(Folder) так и группы(Groups) - в предыдцщих версиях Xcode  использовались группы - основное отличие в том, что группы можно располагать в каком угодно порядке, а папке располагаются только в алфавитном порядке. Использование групп удобнее, позволяет разместить файлы и папки в визуально удобном порядке)
    2. Создадим файл Reminder.swift в папке Models и создаим  в нём структуру Reminder
    3. В этой структуре обяъявим свойства title dueDate
    4. Добавим опциональное значение notes со значением по умолчанию nil
    5. isCompleded 
    6. Добавим раширение к структуре Reminder с аннотацией #if Debug -> #endif
    7. Добавим массив с экземплярами структуры Reminder в extension с ключевым словом static 
    
## Section 4: Configure a collection as list
    Конфигурация  collection view будет создаваться при помощи compositional layout
    1. Соединим Main.storyboard и ViewController и переименуем название класса и суперкласса -> новоё имя добавим при помощи refactor->rename(mouse right click)
    2. В Main.storyboard справа во вкладке identity inspector назначим ReminderListViewController
    3. В ReminderListViewController создадим функцию listLayout()
    4. Убираем разделители(сепараторы) и цвет заднего фона ставим прозрачным
    5. Вернём в функции UICollectionViewCompositionalLayout с конфигурацией listConfiguration
    6. Во ViewDidLoad создадим экземпляр listLayout
    7. Присвоим collectionView - listLayout
    
## Section 5: Configure data source
   В этой секции сделаем регистрацию cell в collection view и добавим apperance(как будет выглядеть) к cell. Соединим data source и cell.
   
   Будет использован Diffable data source - позволяет делать update и анимацию интерфейса при его изменениях
   
   1. Создадим регистрацию новой ячейки cell 
   2. Получим данные Reminder для каждой ячейки
   3. Получим дизайн ячейки (Конфигурация контента ячейки по умолчанию)
   4. Добавим значения для content configuration 
   5. Добавим type alias для Diffable data source
   6. Добавим опциональное свойство DataSource
   7. Присвоим значение для data source
   8. Добавим регистрацию ячейки
   
## Section 6: Apply a snapshot
    Diffable data source управляет состоянием данных при помощи при помощи снэпшотов(snapshot). Snapshot представляет состояние ваших данных в определенный период времени. Чтобы отображать данные при помощи snapshot необходимо:
    1 - Создать snapshot
    2 - Заполняем snapshot данными, которые хотим отобразить
    3 - Применяем snapshot к пользоватеьлскому интерфейсу
    
    В этой секции сделаем шаги описанные выше.
    
    1. Добавим type alias для snapshot
    2. Создадим вариант Snapshot в методе viewDidLoad
    3. Добавим секции collectionView к snapshot
    4. Создадим новый массив, который содержит только reminder titles
    5. В этом шаге предлагается рассмотреть второй вариант кода, который будет короче, но выполнять те же действия, что и в шаге 4
    6. Применим snapshot к data source
    7. Передадим данные data source в collection view
    8. Запустим приложение
    
## Section 7: Displaying cell info
    1. В папке Models создадим файл Date+Today в котором создадим раширение для Date
    2. Добавим вычисляемое свойство для отображения текста дня и времени
    3. Создадим константу со строковым значением 
    4. Добавим if-else который будет проверять является ли дата из календаря текущей датой
    5. Добавим локализованную строку, чтобы любой пользоватеьл мог прочитать сообщение
    6. Вернём строку и применим timeFormat к timeText
    7. При помощи метода formatted() создадим строку с данными даты. Этот метод позволяет создать строковый формат времени с локализацией
    8. Создадим локализованную строку для отображения date time
    9. Вернём строку для второго условия
    10. Создадим еще одно вычисляемое свойство, которое будет показфывать строку если дата является текущей датой, если дата не является текущей, то вернём просто отформатированную дату при помощи formatted()
    
## Section 8: Organize view controllers
    Поскольку view controller включает в себя много кода, для того чтобы упорядочить код, часть кода будет переносится в extensions в отдельные файлы. Поскольку view controller может иметь много задач, разделение в разные фалы в расширения существенно облегчит в дальнейшем поиск ошибок и добавление новых фич
    1. Выбрать файл ReminderListViewController.swift -> правая кнопка мыши -> создать паку ListViewController (New group from selection or new folder from selection)
    2. Создадим файл ReminderListViewController+DataSource.swift,  import UIKit
    3. Сделаем extension ReminderListViewController и поместим в него typealias
    4. Создадим метод cellRegistrationHandler и перенесём регистрацию ячейки в новый метод
    5. В cellRegistration вместо замыкания используем метод из пункта 4
    6. Добавим к данным ячейки due date из структуры Reminder
    7. Изменим шрифт для вторичного текста
    8. Запустим приложение
    
## Section 9: Change the cell background color
    В этой секции будем использовать предустановленные цвета для изменения цвета фона ячейки
    1. В файле ReminderListViewController+DataSource.swift создадим переменную backgroundConfiguration
    2. Добавим в проект подготовленные цвета
    3. Присвоим значению backgroundConfiguration.backgroundColor значение
    4. Добавим конфигурацию соотвествующему ствойству ячейки
    
## Section 10: Display the reminder complete status
     Добавим круглую кнопку, которая будет отображать выполнено задание или нет
     1. Создаим функцию doneButtonConfiguration в файле ReminderListViewController+DataSource.swif
     2. Добавим константу для выбора картинки выполнено задание или нет
     3. Добавми конфигурацию для задания символу размера
     4. Создадим новый image с ипользованием констант созданных ранее
     5. Добавим кноппку
     6. Зададим картинку для кнопки
     7. Вернём custom view configuration
     8. Сделаем вызов этого метода в cell handler
     9. Добавим в конфигурауию tint color 
     10. Добавим в массив cell accessories и добавим в него custom view
     11. Build ans run
     
## На данном этапе закончена конфигурация ячеек так, чтобы время отображалось корректно во всех регионах и странах, а так же сделали отображение данных по каждому напоминанию включая выполнено оно или нет
    
## Making reminders identifiable
    В этой части модель Reminders будет подведена под протокол Identifiable, чтобы можно было изменять каждое отдельное напоминание.
    
## Section 11:Making the model identifiable
    Для того чтобы вносить изменения в отдельные напоминания, нужно чтобы модель имела идентификатор для каждой сущности 
    1. В файле Reminder.swift подшипешм структуру Reminder под протокол Identifiable и добавим переменную идентификатора в виде строкового значения.
    2. В файле ReminderListViewController.swift в dataSource изменим стандартный itemIdentifier на Reminder.ID
    Reminder.ID - это assosiated type из протокола Identifiable 
    3. Добавим новое свойство remiders - массив Reminder. Зачем понадобилось это свойство? видимо потому что нет возможности вносить изменения непосредственно в свойство sampleReminders структуры Reminder
    4. Сделаем снова конфигурацию snapshot при помощи свойства из пункта 3
    5. В type alias DataSource и Snapshot поменяем String на Reminder.ID
    6. Поменяем identifier для cellRegistrationHandler
    7. Сделаем получение отдельной сущности reminder из массива 
    
## Section 12: Create functions for accessing the model
    1. В файле Reminder.swift сделаем расширение для массива в структуре Reminder. Классно - можно сделать расширение не только для структуры или класса, а сразу для массива. Посмотрим далее как это будет выглядеть в коде. Есть два варианта синтаксиса для написания такого кода:
    extension [Reminder] или 
    extension Array where Element == Reminder.
    Что будет(какая будет разница) если методы ниже поместить в расширение просто структры Reminder
    2. Напишим функцию, которая будет возовращать index определенного Reminder, будет принимать id и возвращать Self.Index. Array.Index - это type alias для Int
    3.Напишем guard который будет проверять что найден первый элемент удовлетворяющий ID и вернём index
    4. В файле ReminderListViewController+DataSource.swift добавим метод reminder(with id:)
    5. добавим еще один метод updateReminder(reminder: Reminder)
    6. Изменим cell registration handler при помощи новых методов
    
## Section 13: Create custom button action
    В этой секции будет добавлен код, который будет изменять статус напоминания ( выполнено или нет)
    1. В паке ListViewController добавим файл ReminderDoneButton.swift импорт UIKit и создание класса ReminderDoneButton
    2. Добавим свойство id
    3. В файле ReminderListViewController+DataSource.swift создадим метод completeReminder
    4. Получим reminder с нужным нам ID
    5. Изменим в этом reminder свойство isComplete и сделаем update
    6. Создадим новый файл ReminderListViewController+Actions.swift
    7. В этом файле создадим расширение для ReminderListViewController и в нём создадим метод didPressDoneButton с ключевым словом @objc - которое позволит использовать данный метод с Objective-C в дальнейшем
    8. Послкольку id опциональное совйство - сделаем unwrap при помощи guard
    9. Вызоввем метод completeReminder
    
    В следущей секции соединим кнопку и метод для кнопки
    
## Section 14: Write a target-action pair
    1. В файле ReminderListViewController+DataSource.swift изменим класс UIButton на ReminderDoneButton
    2. Добавим свойство button.id
    3. Добавим таргет к кнопке
    4. Build and run
    
## Section 15: Update the snapshot
    Когда в рпиложении используют diffable data source, то используют snapshot чтобы сделать update UI в приложении. 
    В этой секции будем создавать и применять новый snapshot когда пользователь нажимает кнопку Done
    
    1. В файле ReminderListViewController+DataSource.swift создадим метод updateSnapshot()
    2. Переместим код для обновления snapshot из метода viewDidLoad в этот метод
    3. Сделаем вызов метода updateSnapshot() в методе viewDidLoad()
    4. Так же сделаем вызов этого метода в completeReminder()
    5. Добавим в updateSnapshot() аргумент ввиде массива id напоминаний
    6. Если принятый массив содержит данные(не пустой), сделаем обновление данных в этом массиве
    7. Так же скорректируем вызов updateSnapshot() в методе cpmpleteReminder()
    
## Section 16: Make the action accessible
    В этой секции будет добавлена возможность управлять напоминаниями при помощи voiceOver
    1. В файл ReminderListViewController+DataSource.swift добавим метод doneButtonAccessibilityAction 
    2. Создадим переменную для названия этого действия
    3. Создадим свойство action
    4. Для выполнения действия вызовем метод completeReminder
    5. В cell registration handler в свойство cell добавим accessebilityCustomAction
    6. Создадим два свойства reminderCompleteValue и reminderNotCompleteValue
    7. В cell registration handler добавим свойство cell accessebilityValue
    
## Section 17: Preview using accessibility inspector
    В этой секции рассмотрим как просмотреть на симуляторе accessibility action
    1. Запустить симулятор( Build ans run)
    2. В меню Xcode-> Open developer tool -> Accessebility inspector
    3. В Accessebility inspector выбрать inspection button и затем навести на первое напоминания в симуляторе
    4. Проверить результат в accessibility inspector
    
# Displaying reminder details
    Далее будут описаны шаги для создания view controller для того чтобы отображать детали каждого напоминания
## Section 18: Create a reminder view
    1. Создадаим файл ReminderViewController.swift, создадим в файле класс с таким же названием и наследованием от UICollectionViewController
    2. Создадим свойство reminder чтобы было что отображать и менять данные в напоминании и создадим init для этого свойства
    3. Добавим в инициализатор listConfiguration и далее уберём отображение разделителей в списке
    4. Зададим layout 
    5. Добавим super init
    6. Чтобы убрать ошибку добавим required init
    
    
    
