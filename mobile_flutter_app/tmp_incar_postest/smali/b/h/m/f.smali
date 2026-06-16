.class public Lb/h/m/f;
.super Ljava/lang/Object;
.source "KeyEventDispatcher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/h/m/f$a;
    }
.end annotation


# static fields
.field public static a:Z = false

.field public static b:Ljava/lang/reflect/Method; = null

.field public static c:Z = false

.field public static d:Ljava/lang/reflect/Field;


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public static a(Landroid/app/Dialog;)Landroid/content/DialogInterface$OnKeyListener;
    .registers 4

    .line 26
    sget-boolean v0, Lb/h/m/f;->c:Z

    if-nez v0, :cond_14

    const/4 v0, 0x1

    .line 27
    :try_start_5
    const-class v1, Landroid/app/Dialog;

    const-string v2, "mOnKeyListener"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lb/h/m/f;->d:Ljava/lang/reflect/Field;

    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_12
    .catch Ljava/lang/NoSuchFieldException; {:try_start_5 .. :try_end_12} :catch_12

    .line 29
    :catch_12
    sput-boolean v0, Lb/h/m/f;->c:Z

    .line 30
    :cond_14
    sget-object v0, Lb/h/m/f;->d:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_1f

    .line 31
    :try_start_18
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/DialogInterface$OnKeyListener;
    :try_end_1e
    .catch Ljava/lang/IllegalAccessException; {:try_start_18 .. :try_end_1e} :catch_1f

    return-object p0

    :catch_1f
    :cond_1f
    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Landroid/app/ActionBar;Landroid/view/KeyEvent;)Z
    .registers 8

    .line 10
    sget-boolean v0, Lb/h/m/f;->a:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1a

    .line 11
    :try_start_6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v3, "onMenuKeyEvent"

    new-array v4, v1, [Ljava/lang/Class;

    const-class v5, Landroid/view/KeyEvent;

    aput-object v5, v4, v2

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lb/h/m/f;->b:Ljava/lang/reflect/Method;
    :try_end_18
    .catch Ljava/lang/NoSuchMethodException; {:try_start_6 .. :try_end_18} :catch_18

    .line 12
    :catch_18
    sput-boolean v1, Lb/h/m/f;->a:Z

    .line 13
    :cond_1a
    sget-object v0, Lb/h/m/f;->b:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_2d

    :try_start_1e
    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v2

    .line 14
    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_2c
    .catch Ljava/lang/IllegalAccessException; {:try_start_1e .. :try_end_2c} :catch_2d
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1e .. :try_end_2c} :catch_2d

    return p0

    :catch_2d
    :cond_2d
    return v2
.end method

.method public static a(Landroid/app/Activity;Landroid/view/KeyEvent;)Z
    .registers 7

    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->onUserInteraction()V

    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x8

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/Window;->hasFeature(I)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_25

    .line 18
    invoke-virtual {p0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    .line 19
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v3

    const/16 v4, 0x52

    if-ne v3, v4, :cond_25

    if-eqz v1, :cond_25

    .line 20
    invoke-static {v1, p1}, Lb/h/m/f;->a(Landroid/app/ActionBar;Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_25

    return v2

    .line 21
    :cond_25
    invoke-virtual {v0, p1}, Landroid/view/Window;->superDispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_2c

    return v2

    .line 22
    :cond_2c
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 23
    invoke-static {v0, p1}, Lb/h/m/y;->a(Landroid/view/View;Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_37

    return v2

    :cond_37
    if-eqz v0, :cond_3e

    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    move-result-object v0

    goto :goto_3f

    :cond_3e
    const/4 v0, 0x0

    .line 25
    :goto_3f
    invoke-virtual {p1, p0, v0, p0}, Landroid/view/KeyEvent;->dispatch(Landroid/view/KeyEvent$Callback;Landroid/view/KeyEvent$DispatcherState;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static a(Landroid/app/Dialog;Landroid/view/KeyEvent;)Z
    .registers 5

    .line 32
    invoke-static {p0}, Lb/h/m/f;->a(Landroid/app/Dialog;)Landroid/content/DialogInterface$OnKeyListener;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_12

    .line 33
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    invoke-interface {v0, p0, v2, p1}, Landroid/content/DialogInterface$OnKeyListener;->onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_12

    return v1

    .line 34
    :cond_12
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 35
    invoke-virtual {v0, p1}, Landroid/view/Window;->superDispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v2

    if-eqz v2, :cond_1d

    return v1

    .line 36
    :cond_1d
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 37
    invoke-static {v0, p1}, Lb/h/m/y;->a(Landroid/view/View;Landroid/view/KeyEvent;)Z

    move-result v2

    if-eqz v2, :cond_28

    return v1

    :cond_28
    if-eqz v0, :cond_2f

    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    move-result-object v0

    goto :goto_30

    :cond_2f
    const/4 v0, 0x0

    .line 39
    :goto_30
    invoke-virtual {p1, p0, v0, p0}, Landroid/view/KeyEvent;->dispatch(Landroid/view/KeyEvent$Callback;Landroid/view/KeyEvent$DispatcherState;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static a(Landroid/view/View;Landroid/view/KeyEvent;)Z
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lb/h/m/y;->b(Landroid/view/View;Landroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static a(Lb/h/m/f$a;Landroid/view/View;Landroid/view/Window$Callback;Landroid/view/KeyEvent;)Z
    .registers 7

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    .line 2
    :cond_4
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_f

    .line 3
    invoke-interface {p0, p3}, Lb/h/m/f$a;->a(Landroid/view/KeyEvent;)Z

    move-result p0

    return p0

    .line 4
    :cond_f
    instance-of v1, p2, Landroid/app/Activity;

    if-eqz v1, :cond_1a

    .line 5
    check-cast p2, Landroid/app/Activity;

    invoke-static {p2, p3}, Lb/h/m/f;->a(Landroid/app/Activity;Landroid/view/KeyEvent;)Z

    move-result p0

    return p0

    .line 6
    :cond_1a
    instance-of v1, p2, Landroid/app/Dialog;

    if-eqz v1, :cond_25

    .line 7
    check-cast p2, Landroid/app/Dialog;

    invoke-static {p2, p3}, Lb/h/m/f;->a(Landroid/app/Dialog;Landroid/view/KeyEvent;)Z

    move-result p0

    return p0

    :cond_25
    if-eqz p1, :cond_2d

    .line 8
    invoke-static {p1, p3}, Lb/h/m/y;->a(Landroid/view/View;Landroid/view/KeyEvent;)Z

    move-result p1

    if-nez p1, :cond_33

    .line 9
    :cond_2d
    invoke-interface {p0, p3}, Lb/h/m/f$a;->a(Landroid/view/KeyEvent;)Z

    move-result p0

    if-eqz p0, :cond_34

    :cond_33
    const/4 v0, 0x1

    :cond_34
    return v0
.end method
