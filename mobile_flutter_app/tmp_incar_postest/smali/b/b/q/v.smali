.class public Lb/b/q/v;
.super Landroidx/appcompat/widget/ListPopupWindow;
.source "MenuPopupWindow.java"

# interfaces
.implements Lb/b/q/u;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/b/q/v$a;
    }
.end annotation


# static fields
.field public static Q:Ljava/lang/reflect/Method;


# instance fields
.field public P:Lb/b/q/u;


# direct methods
.method public static constructor <clinit>()V
    .registers 5

    .line 1
    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-gt v0, v1, :cond_20

    .line 2
    const-class v0, Landroid/widget/PopupWindow;

    const-string v1, "setTouchModal"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lb/b/q/v;->Q:Ljava/lang/reflect/Method;
    :try_end_18
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_18} :catch_19

    goto :goto_20

    :catch_19
    const-string v0, "MenuPopupWindow"

    const-string v1, "Could not find method setTouchModal() on PopupWindow. Oh well."

    .line 3
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_20
    :goto_20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/appcompat/widget/ListPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Z)Lb/b/q/r;
    .registers 4

    .line 1
    new-instance v0, Lb/b/q/v$a;

    invoke-direct {v0, p1, p2}, Lb/b/q/v$a;-><init>(Landroid/content/Context;Z)V

    .line 2
    invoke-virtual {v0, p0}, Lb/b/q/v$a;->setHoverListener(Lb/b/q/u;)V

    return-object v0
.end method

.method public a(Lb/b/p/j/g;Landroid/view/MenuItem;)V
    .registers 4

    .line 6
    iget-object v0, p0, Lb/b/q/v;->P:Lb/b/q/u;

    if-eqz v0, :cond_7

    .line 7
    invoke-interface {v0, p1, p2}, Lb/b/q/u;->a(Lb/b/p/j/g;Landroid/view/MenuItem;)V

    :cond_7
    return-void
.end method

.method public a(Lb/b/q/u;)V
    .registers 2

    .line 5
    iput-object p1, p0, Lb/b/q/v;->P:Lb/b/q/u;

    return-void
.end method

.method public a(Ljava/lang/Object;)V
    .registers 4

    .line 3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_d

    .line 4
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    check-cast p1, Landroid/transition/Transition;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setEnterTransition(Landroid/transition/Transition;)V

    :cond_d
    return-void
.end method

.method public b(Lb/b/p/j/g;Landroid/view/MenuItem;)V
    .registers 4

    .line 3
    iget-object v0, p0, Lb/b/q/v;->P:Lb/b/q/u;

    if-eqz v0, :cond_7

    .line 4
    invoke-interface {v0, p1, p2}, Lb/b/q/u;->b(Lb/b/p/j/g;Landroid/view/MenuItem;)V

    :cond_7
    return-void
.end method

.method public b(Ljava/lang/Object;)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_d

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    check-cast p1, Landroid/transition/Transition;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setExitTransition(Landroid/transition/Transition;)V

    :cond_d
    return-void
.end method

.method public d(Z)V
    .registers 6

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-gt v0, v1, :cond_22

    .line 2
    sget-object v0, Lb/b/q/v;->Q:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_27

    .line 3
    :try_start_a
    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_19} :catch_1a

    goto :goto_27

    :catch_1a
    const-string p1, "MenuPopupWindow"

    const-string v0, "Could not invoke setTouchModal() on PopupWindow. Oh well."

    .line 4
    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_27

    .line 5
    :cond_22
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setTouchModal(Z)V

    :cond_27
    :goto_27
    return-void
.end method
