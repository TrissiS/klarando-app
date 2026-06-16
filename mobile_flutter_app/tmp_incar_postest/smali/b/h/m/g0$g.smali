.class public Lb/h/m/g0$g;
.super Lb/h/m/g0$l;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/g0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "g"
.end annotation


# static fields
.field public static g:Z = false

.field public static h:Ljava/lang/reflect/Method;

.field public static i:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static j:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static k:Ljava/lang/reflect/Field;

.field public static l:Ljava/lang/reflect/Field;


# instance fields
.field public final c:Landroid/view/WindowInsets;

.field public d:Lb/h/f/b;

.field public e:Lb/h/m/g0;

.field public f:Lb/h/f/b;


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>(Lb/h/m/g0;Landroid/view/WindowInsets;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Lb/h/m/g0$l;-><init>(Lb/h/m/g0;)V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lb/h/m/g0$g;->d:Lb/h/f/b;

    .line 3
    iput-object p2, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    return-void
.end method

.method public constructor <init>(Lb/h/m/g0;Lb/h/m/g0$g;)V
    .registers 4

    .line 4
    new-instance v0, Landroid/view/WindowInsets;

    iget-object p2, p2, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    invoke-direct {v0, p2}, Landroid/view/WindowInsets;-><init>(Landroid/view/WindowInsets;)V

    invoke-direct {p0, p1, v0}, Lb/h/m/g0$g;-><init>(Lb/h/m/g0;Landroid/view/WindowInsets;)V

    return-void
.end method

.method public static j()V
    .registers 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    :try_start_1
    const-class v1, Landroid/view/View;

    const-string v2, "getViewRootImpl"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lb/h/m/g0$g;->h:Ljava/lang/reflect/Method;

    const-string v1, "android.view.ViewRootImpl"

    .line 2
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lb/h/m/g0$g;->i:Ljava/lang/Class;

    const-string v1, "android.view.View$AttachInfo"

    .line 3
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lb/h/m/g0$g;->j:Ljava/lang/Class;

    const-string v2, "mVisibleInsets"

    .line 4
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lb/h/m/g0$g;->k:Ljava/lang/reflect/Field;

    .line 5
    sget-object v1, Lb/h/m/g0$g;->i:Ljava/lang/Class;

    const-string v2, "mAttachInfo"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lb/h/m/g0$g;->l:Ljava/lang/reflect/Field;

    .line 6
    sget-object v1, Lb/h/m/g0$g;->k:Ljava/lang/reflect/Field;

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 7
    sget-object v1, Lb/h/m/g0$g;->l:Ljava/lang/reflect/Field;

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_3a
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_1 .. :try_end_3a} :catch_3b

    goto :goto_56

    :catch_3b
    move-exception v1

    .line 8
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to get visible insets. (Reflection error). "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/ReflectiveOperationException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "WindowInsetsCompat"

    invoke-static {v3, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 9
    :goto_56
    sput-boolean v0, Lb/h/m/g0$g;->g:Z

    return-void
.end method


# virtual methods
.method public a(IIII)Lb/h/m/g0;
    .registers 7

    .line 1
    new-instance v0, Lb/h/m/g0$b;

    iget-object v1, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    invoke-static {v1}, Lb/h/m/g0;->a(Landroid/view/WindowInsets;)Lb/h/m/g0;

    move-result-object v1

    invoke-direct {v0, v1}, Lb/h/m/g0$b;-><init>(Lb/h/m/g0;)V

    .line 2
    invoke-virtual {p0}, Lb/h/m/g0$g;->g()Lb/h/f/b;

    move-result-object v1

    invoke-static {v1, p1, p2, p3, p4}, Lb/h/m/g0;->a(Lb/h/f/b;IIII)Lb/h/f/b;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb/h/m/g0$b;->b(Lb/h/f/b;)Lb/h/m/g0$b;

    .line 3
    invoke-virtual {p0}, Lb/h/m/g0$l;->f()Lb/h/f/b;

    move-result-object v1

    invoke-static {v1, p1, p2, p3, p4}, Lb/h/m/g0;->a(Lb/h/f/b;IIII)Lb/h/f/b;

    move-result-object p1

    invoke-virtual {v0, p1}, Lb/h/m/g0$b;->a(Lb/h/f/b;)Lb/h/m/g0$b;

    .line 4
    invoke-virtual {v0}, Lb/h/m/g0$b;->a()Lb/h/m/g0;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/view/View;)V
    .registers 2

    .line 8
    invoke-virtual {p0, p1}, Lb/h/m/g0$g;->b(Landroid/view/View;)Lb/h/f/b;

    move-result-object p1

    if-nez p1, :cond_8

    .line 9
    sget-object p1, Lb/h/f/b;->e:Lb/h/f/b;

    .line 10
    :cond_8
    invoke-virtual {p0, p1}, Lb/h/m/g0$g;->a(Lb/h/f/b;)V

    return-void
.end method

.method public a(Lb/h/f/b;)V
    .registers 2

    .line 7
    iput-object p1, p0, Lb/h/m/g0$g;->f:Lb/h/f/b;

    return-void
.end method

.method public a(Lb/h/m/g0;)V
    .registers 3

    .line 5
    iget-object v0, p0, Lb/h/m/g0$g;->e:Lb/h/m/g0;

    invoke-virtual {p1, v0}, Lb/h/m/g0;->a(Lb/h/m/g0;)V

    .line 6
    iget-object v0, p0, Lb/h/m/g0$g;->f:Lb/h/f/b;

    invoke-virtual {p1, v0}, Lb/h/m/g0;->a(Lb/h/f/b;)V

    return-void
.end method

.method public a([Lb/h/f/b;)V
    .registers 2

    return-void
.end method

.method public final b(Landroid/view/View;)Lb/h/f/b;
    .registers 6

    const-string v0, "WindowInsetsCompat"

    .line 2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-ge v1, v2, :cond_60

    .line 3
    sget-boolean v1, Lb/h/m/g0$g;->g:Z

    if-nez v1, :cond_f

    .line 4
    invoke-static {}, Lb/h/m/g0$g;->j()V

    .line 5
    :cond_f
    sget-object v1, Lb/h/m/g0$g;->h:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    if-eqz v1, :cond_5f

    sget-object v3, Lb/h/m/g0$g;->j:Ljava/lang/Class;

    if-eqz v3, :cond_5f

    sget-object v3, Lb/h/m/g0$g;->k:Ljava/lang/reflect/Field;

    if-nez v3, :cond_1d

    goto :goto_5f

    :cond_1d
    const/4 v3, 0x0

    :try_start_1e
    new-array v3, v3, [Ljava/lang/Object;

    .line 6
    invoke-virtual {v1, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_31

    const-string p1, "Failed to get visible insets. getViewRootImpl() returned null from the provided view. This means that the view is either not attached or the method has been overridden"

    .line 7
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    invoke-static {v0, p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v2

    .line 8
    :cond_31
    sget-object v1, Lb/h/m/g0$g;->l:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 9
    sget-object v1, Lb/h/m/g0$g;->k:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Rect;

    if-eqz p1, :cond_45

    .line 10
    invoke-static {p1}, Lb/h/f/b;->a(Landroid/graphics/Rect;)Lb/h/f/b;

    move-result-object v2
    :try_end_45
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_1e .. :try_end_45} :catch_46

    :cond_45
    return-object v2

    :catch_46
    move-exception p1

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to get visible insets. (Reflection error). "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/ReflectiveOperationException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5f
    :goto_5f
    return-object v2

    .line 12
    :cond_60
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "getVisibleInsets() should not be called on API >= 30. Use WindowInsets.isVisible() instead."

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public b(Lb/h/m/g0;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/h/m/g0$g;->e:Lb/h/m/g0;

    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3

    .line 1
    invoke-super {p0, p1}, Lb/h/m/g0$l;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 p1, 0x0

    return p1

    .line 2
    :cond_8
    check-cast p1, Lb/h/m/g0$g;

    .line 3
    iget-object v0, p0, Lb/h/m/g0$g;->f:Lb/h/f/b;

    iget-object p1, p1, Lb/h/m/g0$g;->f:Lb/h/f/b;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final g()Lb/h/f/b;
    .registers 5

    .line 1
    iget-object v0, p0, Lb/h/m/g0$g;->d:Lb/h/f/b;

    if-nez v0, :cond_22

    .line 2
    iget-object v0, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    .line 3
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    move-result v0

    iget-object v1, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    .line 4
    invoke-virtual {v1}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v1

    iget-object v2, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    .line 5
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    move-result v2

    iget-object v3, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    .line 6
    invoke-virtual {v3}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v3

    .line 7
    invoke-static {v0, v1, v2, v3}, Lb/h/f/b;->a(IIII)Lb/h/f/b;

    move-result-object v0

    iput-object v0, p0, Lb/h/m/g0$g;->d:Lb/h/f/b;

    .line 8
    :cond_22
    iget-object v0, p0, Lb/h/m/g0$g;->d:Lb/h/f/b;

    return-object v0
.end method

.method public i()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/g0$g;->c:Landroid/view/WindowInsets;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->isRound()Z

    move-result v0

    return v0
.end method
