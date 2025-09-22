#  Reminders List UIKit

Зачем вообще это нужно и зачем тратить на это время, ради чего это затевается? Это первый вопрос, на который должен быть дан очень чёткий ответ!

Reminders app - приложение заметки на UIKit
Термины: 
**typealias** - это ключевое слово в языке Swift предназанчено для переименования типов данных для создания более удобного для восприятия кода

**CollectionDiffableDataSource**:
Это объект для управления данными и предоставления cells для collection view, нужен для управления изменениями в данных для collection view и UI.

@MainActor @preconcurrency
class UICollectionViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType> where SectionIdentifierType : Hashable, SectionIdentifierType : Sendable, ItemIdentifierType : Hashable, ItemIdentifierType : Sendable

**DiffableDataSourceSnapshot**:
Это представление состояния данных во view в определенный момент времени.

@preconcurrency
struct NSDiffableDataSourceSnapshot<SectionIdentifierType, ItemIdentifierType> where SectionIdentifierType : Hashable, SectionIdentifierType : Sendable, ItemIdentifierType : Hashable, ItemIdentifierType : Sendable



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
    
## Section 19: Create an enumerations for rows
    В этой секции будет сделана нумерация строк чтобы стилизовать каждую строку как требуется
    1. В папке Detail view contorller создадим файл ReminderViewController+Row.swift и создадим в этом файле extension
    2. Создадим enum c протоколом hashable - соотвествие этому протоколу требуется при использовании diffable data source
    3. Добавим case в enum
    4. Добавим вычисляемое свойство imageName чтобы предоставить картинку для каждокого из case
    5. Создадим переменнцю image которая будет создавать картинку по назвнию из imageName
    6. Создадим вычисляемое свойство textstyle
    8. В файле ReminderViewController.swift создадим метод text(for:)
    
## Section 20: Setup data source
    В этой секции будет создана конфигурация для ячеек detail view
    1. В файле ReminderViewController.swift создадим typealias для DataSource для detail view. DataSource это дженерик и указывая параметры Int и Row мы указываем компиляторы что DataSource использует их.
    2. Добавляем свойство dataSource 
    3. Создаём метод cellRegistrationhandler который принимает cell indexPath и row
    4. В этом методе создадим переменную contentConfiguration
    5. Сдулаем конфигурацию текста и шрифта для каждой row
    6. Добавим конфигурацию image
    7. Применим созданную конфигурацию к ячейке
    8. Зададим tintColor свойство для cell
    9. Сделаем вызов viewDidLoad 
    10. Сделаем cell registration
    11. Зададим значение для dataSource
    
## Section 21: Set up a snapshot
    1. Сделаем typealias Snapshot, который так же дженерик и будет принимать Int и Row
    2. Создадим метод updateSnapshot
    3. Создадим новую переменную snapshot
    4. Добавим к snapshot первую секцию
    5. Добавим к snapshot сущности row
    6. Применим этот snapshot к datasource
    7. Сделаем вызов updateSnapshot во viewDidLoad
    
## Section 22: Display the detail view
    В этой секции будет создан экземпляр detail view и в него будет добавлена зависимость соотвествоющего напоминания
    1. В файле ReminderListViewControler.swift создадим метод pushDetailViewForReminder(with id:)
    2. Создадим переменную в которой будет reminder с нужным id
    3. Сделаем inject этого Reminder в ReminderViewController (DetailViewController)
    4. Сделаем push контроллера в Navigation controller stack
    5. Сделаем override для collection view так чтобы при нажатии на ячейку не происходило изменений в collection view и вместо этого отображался detail view
    6. Получим id нужного напоминания из indexPath
    7. Вызовем метод pushDetailViewForReminder
    8. Добавим navigation controller в фале Main.storyboard
    9. Запустим приложение и убедимся что всё работает
    
## Section 23: Style the navigation bar
    В этой секции будет подвергнут модификации navigation bar таким образом, чтобы navigation bar соотвествовал общему стилю приложения
    1. Открываем файл AppDelegate.swift и добавляем tint colour для navigation bar. Задание значения для данного свойства в методе application(didFifnishLounching: withOptions:) позволяет применить это значение ко всем navigation bar в приложении
    2. Зададим navigation bar background colour
    3. Созададим свойство navBarAppearance
    4. Сделаем вызов метода для конфигурации background
    5. Сделаем так чтобы при скролинге талицы, когда контент достигает nav bar, чтобы контент был поверх nav bar. по умолчанию nav bar над контентом
    6. В файле ReminderViewController.swift зададим новое название для tiile 
    7. Зададим стиль для nav bar = .navigator
    8. Build and run
    
## Getting ready for editing
    В этой части будет выполнен функционал по редактированию Напоминаний Reminder. Будет сделаны два варианта data source в для режима просмотра и для режима редактирования и будут добавлены кнопки при помощи которых будет происходить переключение между этими двумя режимами
    
## Section 24: Create section for an Editing mode
    1. В папке DetailViewController создадим файл ReminderViewController+Section.swift Это будет расширение для ReminderViewController
    2. Создадим enum для хранения номеров секций и подпишем их под hashable
    3. Добавим в enum cases
    4. Создадим вычисляемое свойство name, которое будет определять текст для названия каждой секции
    5. В ReminderViewController.swift в typealias datatype и snapshot поменяем Int на Section
    6. Метод updateSnapshot был расчитан на использование Int. Нужно его модифицировать чтобы убрать ошибку
    7. Седалем метод который будет предоставлять секцию для строки(очень понятно))
    8. Используем indexPath для получения номера секции
    9. Используем номер секции для создания самой секции
    
 ## Section 25: Configure view and editing modes
    ReminderViewController выполняет две функции: редактирование и отображение информации по напоминанию(Reminder). В этой секции создадим два Snapshot для просмотра и для редактирования и начнём делать конфигурацию ячеек для просмотра и для режима редактирования
    1. Изменим название функции updateSnapshot -> updateSnapshotForViewing
    2. Создадим функцию updateSnapshotForEditing
    3. Добавим секции title date и notes
    4. Применим snapshot к datasource
    
    Делаем рефактор для cell чтобы создать два режима: просмотр и редактирование
    5. В cellRegistrationHandler добавим константу section
    6. Добавим switch с использованием tuple. Использование tuple для switch позволяет использовать два компоненита в сочетании друг с другом
    7. Сделаем конфигурацию для view mode
    8. Переместим существующую конфигурацию ячейки в case view
    
## Section 26: Add an edit button
    В этой секции будет добавлена кнопка для reminder view controller для входа и выхода из режима редактирования. Будем делать snapshot update когда view будет делать переход между двумя режимами.
    
    Подклассы UIViewController имеют свойство editButtonItem которое будем использовать для преклюяения между режимами
    
    1. В файле ReminderViewController Во viewDidLoad() добавим это совйство для правой кнопки navigationItem
    2. Система вызовет метод setEditing() сделаем override этого метода
    3. В зависомости от того в какой режим будет переключаться view будем вызывать соотвествующий метод
    4. Сделаем B&R и проверим как работает кнопка
    
## Section 27: Show header in editing mode
    В этой секции будем менять ReminderViewController так, чтобы отображался header. В UIKit в collection views по умолчанию нет header. Можно сделать дополнительный массив с headers или можно использовать как header первый элемент массива 
    1. В файле ReminderViewController+Row добавим case header с associated value String. В enum associated value conforms to hashable protocol
    2. В файле ReminderViewController  в методе text(for:) добавим case по умолчанию который будет возвращать nil
    3. В методе updateSnapshotForEditing() добавим header в каждую секцию
    
    Collection view не включают header по умолчанию, сделаем изменения в collection view configuration чтобы включить headers
    4. Добавим header mode в инициализатор ReminderViewController
    5. В методе updateSnapshotForViewing() добавим пустой header как первый элемент snapshot
    
    Следующим шагом сделаем конфигурацию header cells
    6. В cellRegistrationHandler() добавим case который будет соответсвовать header row и который будет хранить assosiated value String для header row в константе под названием title. Этот case задаёт title для каждой секции
    7. Получим конфигурацию ячейки по умолчанию и сохраним её значение в переменную
    8. Присвоим значение к свойству text
    9. Зададим новое значение конфигурации для cell
    10. B&R и проверим, что при в ходе в режим редактирования отображаются названия секций
    
    # Managing content views
    Content view позволяют вам сосредоточиться на информации, которую вы хотите отобразить во view, не беспокоясь о том, когда обновлять или как оформить view. Они работают с конфигурациями content, чтобы синхронизировать информацию о вашем приложении и пользовательский интерфейс.
## Section 28: Extract configuration methods
    Чем больше добавляем ячеек к пользовательскому интерфейсу, тем более громоздким он становится. В этой секции перенесем конфигурации ячеек в отдельный файл.
    1. В папке DetailViewController создадим файл ReminderViewController+CellConfiguration.swift и сделаем в нём extension для  ReminderViewController 
    2. Создадим функцию default configuration
    3. Переместим содержимое .view case из файла ReminderViewController за исключением cell.contentConfiguration
    4. Сделаем return для content configuration
    5. В файле ReminderViewController при помощи метода defaultConfiguration зададим значение для cell.contentConfiguration
    Далее будет перенесён код для header view
    6. Создадим headerConfiguration
    7. Переместим содержимое .header case в новый метод, за исключением cell.contentConfiguration и выполним действия аналогичные пунктам 4 и 5
    8. Перемести в этот файл функцию text(for:)
    9. Проверим что всё работает и коммит
    
## Section 29: Create reusable layout function
    Используя date picker, text field, и text view пользователь сможет изменять детали напоминания в режиме редактирования. Прикрепим эти subview к их superview по четырём сторонам: top, trailing, bottom, leading таким образом чтобы получились изменяемые отступы в каждом направлении
    1. В панели  project navigatior создадим новую папку ContentViews
    2. В этой папке создадим файл UIView+PinnedSubview и создадим в нём extension для UIView
    
    Поскольку эти subview имеют одинаковое положение, создадим функцию для их прикрепления к superview 
    3. Добавим Subview при помощи встроенного метода 
    Система автоматически генерирует constraints на основе текущего размера и положения view. Но эти ограничения не позволяют view адаптироваться.
    4. Выставим TAMIC to false чтобы система автоматически не проставляля constraints
    Синтаксис constraints UIKit позволяет вам определить и активировать constraints за один шаг, установив свойству isActive нового constarint значение true.
    5. Прикрепим subview к вернему краю superview
    6. Таким же образом установим и для остальных сторон
    7. Если при вызове функции будет задан параметр height, то зададим constrint для данного параметра
    
## Section 30: Create a custom view with text field
    Все элементы управления, которые используются в этом приложении, это всё субклассы UIView
    Чтобы использовать стили и конфигурации кастомных подклассов UIView они будут соотвествовать протоколу UIContentView protocol
    В этой секции будет создан один из элементов управления в котором будет отображиться title. Это будет custom text field
    
    1. В папке ContentViews создадим файл TextFieldContentView.swift + import UIKit
    2. Создадим класс с таким же именем и унаследуем от UIView
    3. Добавим константу textField, которой будет присвоено UITextField
    
    Система присваивает каждому подклассу UIView свой размер содержимого — ширину и высоту, определяемые тем, что он отображает. Например, размер содержимого Label зависит от размера отображаемого текста.
    4. Сделаем override для intrinsic content size чтобы установить высоту равной 44. Установка кастомных значений позоволяет нашего view передвать предпочтительные занчения для system layout
    Далее добавляем text field subview и инициализируем его свойства при создании custom view
    5. Создадим init без аргументов и добавим required init (coder:). Иннициализатор выдаст ошибку, которая будет исправлена в шаге 6
    6. Для начала иниуиализируем view без размера и далее будем управлять финальным расположением при помощи constraints
    Вызываем super.init(frame:) с размером .zero
    7. Делаем вызов addPinnedSubview и указываем отступы для textField
    8. Для text field установим для свойства clearButtonMode значение .whileEditing. Это свойство указывает когда будет показываться значок удаления текста ввода на хвосте text field 
    
## Section 31: Conform to content view protocol
    У объекта, который соотвествует UIContentView должено быть свойство конфигурации с типом UIContentConfiguration, котрое будет добавлено в этой секции.
    Конфигурация, которая будет использоваться в ячейке с text field имеет свойство text, которое содержит значение введёнгное пользователем в textField. В этой секции так же будет создано свойство UIConntentConfiguration.
    UIContentConfiguration protocol требует выполнения двух методов makeContentView() и updated(for:). В этой секции так же будут созданы эти два метода
    1. В папке ContentViews создадим файл UIContentConfiguration+Stateless.swift в котором будет import UIKit и extension UIContentConfiguration
    2. Добавляем функцию updated(for:) которая будет возвращать self. метод updated(for:) позволяет UIContentConfiguration предоставлять специализированную конфигурацию для каждого state. В этом приложении используется одна и таже конфигурация для любого из состояний: normal highlighted selected
    3. В файле TextFieldContentView.swift добавим соотвествие протоколу UIContentView. Добавление этого протокола сгнализирует, что это view будет делеать рендеринг контента и применять стили при помощи ранее заданной конфигурации.
    4. Добавляем свойство для конфигурации котента.
    5. Добавим конфигурацию в принимаемое значение инициализатора
    6. Создадим struct которая будет соотвествовать протоколу UIContentConfiguration. TextFieldContentView.configuraton - будет использоваться чтобы задать параметры контента и view
    7. Создаим  свойство с опциональным типом string и начальным значением : пустая строка
    8. Добавим необходимую функцию makeContentView - необходима для соотвествия протоколу
    9. Добавим в функцию TextFieldContentView(self)
    
## Section 32: Complete the content view
    Content configuration помогает держать интерфейс пользователя в синхронизации с состоянием приложения. в этой секции мы убедимся что UI и app state находятся в синхронизации и UI делает изменения при когда происходят изменения в приложении.
    
    Так же расширим ReminderViewController+CellConfiguration.swift и включим в него функцию которая возвращает text field configuration
    1. Создадим func configure(configuration: UIContentConfiguration)
    2. Сделаем проверку, что конфигурация соотвествует TextFieldContentView.Configuration
    3. Обновим данные text textField из конфигурации 
    4. Добавим didSet observer чтобы вызывать configure при необходимости
    
    Далее расширим поведение UICollectionViewListCell чтобы возвращать кастомную конфигурацию которая будет синхронизированна TextFieldContentView
    5. Добавим расширение для UICollectionViewListCell
    6. Создадим новую функцию textFieldConfiguration() которая будет возращать новое значение TextFieldContentView.Configuration
    7. В файле ReminderListController+CellConfiguration.swift добавим функцию titleConfiguraton(for: with:) которая принимает cell и title и возвращает TextFieldContentView.Configuration
    8. Создадаим конфигурацию с использованием title
    
## Section 33: Display the content view 
    В этой секции добавим редактируемый text field для изменения reminder title 
    Сперва добавим редактируемый случай(editable case) для row и для edit title cell item чтобы редактировать snapshot
    Затем зададим конфигурацию edit title cell при помощи кода созданного в секциях 30-32 
    В конце протестируем работоспособность в приложении
    1. В файле ReminderViewController+Row.swift добавим новый case с именем editableText cо значением String (Associated value String)
    2. В фале ReminderViewController.swift добавим editableText в snapshot.appendItems
    3. В cellRegistrationHandler(cell:indexPath:row:), добавляем новый  case for (.title, .editableText(let title))
    4. Добавим конйигурацию к ячейке
    5. Build and run
    
## Section 34: Create content views for the date and notes
    В этой секции, по аналогии с предыдущей, создадим возможность редактировать дату при помощи date picker и заметки при помощи text view
    Начнем с добавления text view для редактирования заметок.
    1. Впапке ContentViews создадим файл TextViewContentView.swift import UIKit и подпишем под UIView и протокол UIContenView
    2. Далее в инструкции на сайте предлагается пройти и сделать те же шаги что и для Text field view
    3. Добавим TextViewContentView как subview и зададим его размеры. Хотя заданы размеры view, text view обладает встроенными свойствами scroll view и поэтому пользователь сможет добавить больше текста чем может поместиться в размерах view на экране
    4. Сделаем background color nil - чтобы фон был прозарчным
    5. Изменим шрифт на .body
    Date picker
    6. Далее создадим файл DatePickerCOntentView.swift с такими же свойствами что и предыдущие два файла
    7. Делаем необходимые действия в файле как в предыдущих двух view
    8. Добавим(установим) стиль отображаемого date picker
    
    Для того, чтобы завершить создание editing mode надо добавить новый тип строки: editableDate и затем сконфигурировать ячейку
    9. В файл ReminderViewController+Row.swift добавим case
    10. В файле ReminderViewController+CellConfiguration.swift добавим две функции для конфигурации даты и заметок
    11. Добавим эти строки в snapshot
    12. Добавим эти ячейки в cell registration handler
    13. B&R проверим как добавились новые ячейки
    
    Мы добавили ячейки, но выбранные пользователем значения не сохраняются и не отображают изменения в остальных view. Этот вопрос будет решаться в следующих секциях.
    
    # Editing reminders
    В этой части будут добавлены следующий функционал: пользователь выбирает reminder для редактирования и если он нажмёт done будут сохранены все новые данные и все view в которых есть эти данные будут обновлены  пользователь вернётся к detail view, если будет нажата кнопка cancel то возврат к detail view будет осуществлён без сохранения данных.
    
## Section 35: Add a working reminder
    В этой секции будет создан временный reminder для хранения любых изменений, которые пользователь сделает. При выходе из режима редактирования будет произвдено сохранение изменений введенных пользователем в постоянный reminder
    Сперва добавим две функции которые будут выполнять задачи при входе и выходе пользователя из режима редактирования
    1. В файле ReminderViewController.swift добавляем метод prepareForViewing() к классу ReminderViewController который будет вызывать updateSnapshotForViewing()
    2. Вторым шагом добавим prepareForEditing(), которая будет вызывать updateSnapshotForEditing()
    3. В методе setEditing... поменяем методы update... на prepareFor...
    4. Добавим свойство с именем WorkingReminder с типом Reminder, которое будет хранить данные, введённые пользователем до момента выхода из режима редактирования
    5. Добавим workingReminder в инициализатор
    Если пользователь будет делать изменения в workingReminder в режиме редактирования, то будем копировать его значение в reminder, которое отображается в остальных view
    6. В prepareForViewing сделаем reminder update 
    7. Появится ошибка, поскольку для Reminder не были указаны признаки по которым надо сравнивать два объекта, исправим это. В файле Reminder.swift добавим соотвествие протоколу Equatable
    
## Section 36: Make the text configuration editable
    В этой секции настроим text field для редактирования reminder title, определим метод, который будет выполняться каждый раз как в text field будут сделаны изменения. Так же убедимся, что detail view тоже отображает все изменения, которые сделаны в text field после выхода из режима редактирования.
    1. !!! В файле TextFieldContentView.swift в struct Configuration добавим onChange метод без каких либо действий по умолчанию. Это пустое замыкание содержит поведение, которое мы бы хотели выполнить в момент когда пользователь редактирует text field  или text view
    2. Добавим @objc func с названием didChange
        Мы хотим убедиться, что Configuration вызывает обработчик OnChange
    3. Используем guard чтобы опционально обернуть свойство configuration в константу 
    4. Вызываем onChange обработчик и передаём в него содержимое text field или если значение равно nil передадим пустую строку
    5. Подключим этот метод к text filed, в init установим target и action для события .editingChanged 
    Добавляя target и action к этому view при помощи метода didChange selctor при распозновании действий пользователя будет каждый раз вызывать этот метод.
    Можно вызывать этот метод в разные моменты взаимодействия пользователя: когда пользователь коснулся в первый раз, когда пользователь начал редактирвать, когда закончил редактировать или еще как-то взаимодействует с полем
    Чтобы убедиться, что свойство working reminder всегда имеет значение равное последним действиям пользователя, сделаем update title и time для working reminder 
    6. В файле ReminderViewController+CellConfiguration.swift в методе titleConfiguration добавим onChange обработчик который добавит новое значение title для workingReminder
    7. B&R и проверим как работает изменение в title 
    
## Section 37: Make date configuration editable
    В этой секции сделаем изменения в дате и времени при помощи  date picker. Зададим метод, который будет отслеживать изменния в дате и времени в date picker и убедимся, что detail view отображает изменения, при выходе пользователя из режима редактоирования.
    1. В классе DatePickerContentView в struct Configuration добавим обработчик onChange 
    2. Добавим функцию, которая будет сохранять каждое изменение
    3. При помощи guard привяжем свойство Configuration к константе
    4. Сделаем вызов onChange и передадим в него новую дату
    5. В инициализаторе зададим terget и action для события .valueChanged
    6. В файле ReminderViewController+CellConfiguration.swift в функции Configuration добавим onChange обработчик который будет передавать дату и время в working reminder
    7. B&R и проверим как это работает
    
    
