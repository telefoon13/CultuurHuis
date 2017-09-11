<%@page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@taglib prefix='vdab' uri='http://vdab.be/tags' %>
<fmt:setBundle basename="teksten"/>
<fmt:message key='home' var="titel"/>
<!doctype html>
<html lang="nl">
<head>
    <vdab:head title="${titel}"/>
</head>
<body>
<vdab:menu/>
<h1>${titel}</h1>

<p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla erat massa, accumsan non lorem vitae, placerat pulvinar enim.
    Cras tristique scelerisque orci nec porta. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
    Quisque ac nulla diam. Nulla faucibus luctus porttitor. Nunc elit est, sodales ut mi eu, consectetur ornare dui.
    Nam nunc lorem, mattis et augue sit amet, tincidunt vehicula neque.
    In quis luctus augue. Fusce sit amet nisi nisl. Interdum et malesuada fames ac ante ipsum primis in faucibus.
</p>
<p>
    Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse velit elit, dictum vitae sem accumsan, sollicitudin faucibus mi.
    Ut tempor neque a accumsan tincidunt. Vestibulum a luctus diam. Morbi ex nulla, elementum nec eleifend sed, lacinia vel sapien.
    Curabitur iaculis quam massa, sed maximus odio hendrerit id. Vestibulum eu mi rutrum, porta orci at, tincidunt ante. Duis id sem purus.
    Etiam lacinia est non elit gravida, a pulvinar libero maximus. Cras dui felis, fermentum at ligula in, pharetra sagittis dui.
    Phasellus enim massa, aliquet et ullamcorper ut, ultricies id sem. Quisque eget semper orci, eget sollicitudin justo.
    Morbi tincidunt justo urna, vitae molestie nunc vestibulum id.
</p>
<p>
    Integer a tincidunt odio, et ultrices lacus. Suspendisse finibus tortor sed nunc dictum, a tincidunt dui iaculis.
    Phasellus sit amet magna metus. Vivamus id tortor molestie, hendrerit ante et, facilisis ipsum. Mauris ultricies nunc est, a tincidunt nulla iaculis at.
    Suspendisse posuere, diam in vestibulum consectetur, diam elit commodo lacus, nec tristique elit libero eget lacus.
    Nulla rutrum tortor sem, ac dapibus ex varius a. Donec luctus risus at dui dignissim, eget pretium lorem bibendum. Ut sit amet molestie mi, sagittis elementum metus. Vivamus ut ultricies mi. Curabitur aliquam, felis ac tempor condimentum, dui erat condimentum metus, in imperdiet augue lorem et mauris. Nullam eget egestas risus. Integer arcu quam, posuere sed metus in, luctus mattis velit. Praesent metus odio, laoreet eu purus scelerisque, porta ornare lectus. Donec metus est, ornare rhoncus velit in, faucibus eleifend turpis. Phasellus fringilla augue tellus, nec tincidunt nulla mattis eget.
    Vivamus vel bibendum elit. Etiam ante est, mattis eget turpis sit amet, ultrices rutrum metus. Donec et sollicitudin urna, vel condimentum elit.
    Maecenas volutpat elit a felis porttitor, convallis luctus lorem tincidunt. Cras porttitor nunc nisi, et vehicula leo finibus eget. Nulla nec magna ex.
    Donec nec suscipit arcu. Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent vitae volutpat nisi. Nulla nec tortor sapien.
    Fusce imperdiet efficitur dapibus. Vestibulum aliquet scelerisque eleifend. Fusce finibus lectus mauris, eu sagittis quam tempus sed.
    Nunc egestas neque nibh, eget iaculis mauris scelerisque vel. Donec convallis tincidunt purus vel efficitur.
    Ut quis tortor luctus, dictum est cursus, egestas mauris. Cras purus nulla, tempor nec lorem ac, ornare feugiat sem.
    Ut rutrum accumsan quam, in scelerisque ligula ultricies at. Curabitur sagittis blandit arcu, vel rhoncus magna blandit tristique.
    Duis aliquam, sapien eu consequat tempor, mi dolor sodales nunc, ac dignissim turpis diam ac libero. Vivamus finibus tellus a lorem rhoncus, non faucibus nibh.
</p>

</body>
</html>