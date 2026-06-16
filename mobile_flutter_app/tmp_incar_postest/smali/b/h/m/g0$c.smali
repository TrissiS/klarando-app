.class public Lb/h/m/g0$c;
.super Lb/h/m/g0$f;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/g0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# static fields
.field public static e:Ljava/lang/reflect/Field; = null

.field public static f:Z = false

.field public static g:Ljava/lang/reflect/Constructor; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor<",
            "Landroid/view/WindowInsets;",
            ">;"
        }
    .end annotation
.end field

.field public static h:Z = false


# instance fields
.field public c:Landroid/view/WindowInsets;

.field public d:Lb/h/f/b;


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lb/h/m/g0$f;-><init>()V

    .line 2
    invoke-static {}, Lb/h/m/g0$c;->c()Landroid/view/WindowInsets;

    move-result-object v0

    iput-object v0, p0, Lb/h/m/g0$c;->c:Landroid/view/WindowInsets;

    return-void
.end method

.method public constructor <init>(Lb/h/m/g0;)V
    .registers 2

    .line 3
    invoke-direct {p0}, Lb/h/m/g0$f;-><init>()V

    .line 4
    invoke-virtual {p1}, Lb/h/m/g0;->k()Landroid/view/WindowInsets;

    move-result-object p1

    iput-object p1, p0, Lb/h/m/g0$c;->c:Landroid/view/WindowInsets;

    return-void
.end method

.method public static c()Landroid/view/WindowInsets;
    .registers 7

    .line 1
    sget-boolean v0, Lb/h/m/g0$c;->f:Z

    const/4 v1, 0x1

    const-string v2, "WindowInsetsCompat"

    if-nez v0, :cond_1a

    .line 2
    :try_start_7
    const-class v0, Landroid/view/WindowInsets;

    const-string v3, "CONSUMED"

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lb/h/m/g0$c;->e:Ljava/lang/reflect/Field;
    :try_end_11
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_7 .. :try_end_11} :catch_12

    goto :goto_18

    :catch_12
    move-exception v0

    const-string v3, "Could not retrieve WindowInsets.CONSUMED field"

    .line 3
    invoke-static {v2, v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 4
    :goto_18
    sput-boolean v1, Lb/h/m/g0$c;->f:Z

    .line 5
    :cond_1a
    sget-object v0, Lb/h/m/g0$c;->e:Ljava/lang/reflect/Field;

    const/4 v3, 0x0

    if-eqz v0, :cond_33

    .line 6
    :try_start_1f
    invoke-virtual {v0, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowInsets;

    if-eqz v0, :cond_33

    .line 7
    new-instance v4, Landroid/view/WindowInsets;

    invoke-direct {v4, v0}, Landroid/view/WindowInsets;-><init>(Landroid/view/WindowInsets;)V
    :try_end_2c
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_1f .. :try_end_2c} :catch_2d

    return-object v4

    :catch_2d
    move-exception v0

    const-string v4, "Could not get value from WindowInsets.CONSUMED field"

    .line 8
    invoke-static {v2, v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 9
    :cond_33
    sget-boolean v0, Lb/h/m/g0$c;->h:Z

    const/4 v4, 0x0

    if-nez v0, :cond_4f

    .line 10
    :try_start_38
    const-class v0, Landroid/view/WindowInsets;

    new-array v5, v1, [Ljava/lang/Class;

    const-class v6, Landroid/graphics/Rect;

    aput-object v6, v5, v4

    invoke-virtual {v0, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    sput-object v0, Lb/h/m/g0$c;->g:Ljava/lang/reflect/Constructor;
    :try_end_46
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_38 .. :try_end_46} :catch_47

    goto :goto_4d

    :catch_47
    move-exception v0

    const-string v5, "Could not retrieve WindowInsets(Rect) constructor"

    .line 11
    invoke-static {v2, v5, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 12
    :goto_4d
    sput-boolean v1, Lb/h/m/g0$c;->h:Z

    .line 13
    :cond_4f
    sget-object v0, Lb/h/m/g0$c;->g:Ljava/lang/reflect/Constructor;

    if-eqz v0, :cond_69

    :try_start_53
    new-array v1, v1, [Ljava/lang/Object;

    .line 14
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    aput-object v5, v1, v4

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowInsets;
    :try_end_62
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_53 .. :try_end_62} :catch_63

    return-object v0

    :catch_63
    move-exception v0

    const-string v1, "Could not invoke WindowInsets(Rect) constructor"

    .line 15
    invoke-static {v2, v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_69
    return-object v3
.end method


# virtual methods
.method public b()Lb/h/m/g0;
    .registers 3

    .line 2
    invoke-virtual {p0}, Lb/h/m/g0$f;->a()V

    .line 3
    iget-object v0, p0, Lb/h/m/g0$c;->c:Landroid/view/WindowInsets;

    invoke-static {v0}, Lb/h/m/g0;->a(Landroid/view/WindowInsets;)Lb/h/m/g0;

    move-result-object v0

    .line 4
    iget-object v1, p0, Lb/h/m/g0$f;->b:[Lb/h/f/b;

    invoke-virtual {v0, v1}, Lb/h/m/g0;->a([Lb/h/f/b;)V

    .line 5
    iget-object v1, p0, Lb/h/m/g0$c;->d:Lb/h/f/b;

    invoke-virtual {v0, v1}, Lb/h/m/g0;->b(Lb/h/f/b;)V

    return-object v0
.end method

.method public b(Lb/h/f/b;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/h/m/g0$c;->d:Lb/h/f/b;

    return-void
.end method

.method public d(Lb/h/f/b;)V
    .registers 6

    .line 1
    iget-object v0, p0, Lb/h/m/g0$c;->c:Landroid/view/WindowInsets;

    if-eqz v0, :cond_12

    .line 2
    iget v1, p1, Lb/h/f/b;->a:I

    iget v2, p1, Lb/h/f/b;->b:I

    iget v3, p1, Lb/h/f/b;->c:I

    iget p1, p1, Lb/h/f/b;->d:I

    invoke-virtual {v0, v1, v2, v3, p1}, Landroid/view/WindowInsets;->replaceSystemWindowInsets(IIII)Landroid/view/WindowInsets;

    move-result-object p1

    iput-object p1, p0, Lb/h/m/g0$c;->c:Landroid/view/WindowInsets;

    :cond_12
    return-void
.end method
