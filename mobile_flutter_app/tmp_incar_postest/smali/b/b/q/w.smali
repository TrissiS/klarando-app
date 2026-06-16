.class public final Lb/b/q/w;
.super Ljava/lang/Object;
.source "ResourceManagerInternal.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/b/q/w$d;,
        Lb/b/q/w$a;,
        Lb/b/q/w$b;,
        Lb/b/q/w$g;,
        Lb/b/q/w$c;,
        Lb/b/q/w$e;,
        Lb/b/q/w$f;
    }
.end annotation


# static fields
.field public static final h:Landroid/graphics/PorterDuff$Mode;

.field public static i:Lb/b/q/w;

.field public static final j:Lb/b/q/w$c;


# instance fields
.field public a:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/content/Context;",
            "Lb/e/h<",
            "Landroid/content/res/ColorStateList;",
            ">;>;"
        }
    .end annotation
.end field

.field public b:Lb/e/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/g<",
            "Ljava/lang/String;",
            "Lb/b/q/w$e;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lb/e/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/h<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/content/Context;",
            "Lb/e/d<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/drawable/Drawable$ConstantState;",
            ">;>;>;"
        }
    .end annotation
.end field

.field public e:Landroid/util/TypedValue;

.field public f:Z

.field public g:Lb/b/q/w$f;


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    sput-object v0, Lb/b/q/w;->h:Landroid/graphics/PorterDuff$Mode;

    .line 2
    new-instance v0, Lb/b/q/w$c;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lb/b/q/w$c;-><init>(I)V

    sput-object v0, Lb/b/q/w;->j:Lb/b/q/w$c;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/WeakHashMap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/WeakHashMap;-><init>(I)V

    iput-object v0, p0, Lb/b/q/w;->d:Ljava/util/WeakHashMap;

    return-void
.end method

.method public static a(Landroid/util/TypedValue;)J
    .registers 5

    .line 19
    iget v0, p0, Landroid/util/TypedValue;->assetCookie:I

    int-to-long v0, v0

    const/16 v2, 0x20

    shl-long/2addr v0, v2

    iget p0, p0, Landroid/util/TypedValue;->data:I

    int-to-long v2, p0

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static declared-synchronized a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;
    .registers 5

    const-class v0, Lb/b/q/w;

    monitor-enter v0

    .line 80
    :try_start_3
    sget-object v1, Lb/b/q/w;->j:Lb/b/q/w$c;

    invoke-virtual {v1, p0, p1}, Lb/b/q/w$c;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v1

    if-nez v1, :cond_15

    .line 81
    new-instance v1, Landroid/graphics/PorterDuffColorFilter;

    invoke-direct {v1, p0, p1}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 82
    sget-object v2, Lb/b/q/w;->j:Lb/b/q/w$c;

    invoke-virtual {v2, p0, p1, v1}, Lb/b/q/w$c;->a(ILandroid/graphics/PorterDuff$Mode;Landroid/graphics/PorterDuffColorFilter;)Landroid/graphics/PorterDuffColorFilter;
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_17

    .line 83
    :cond_15
    monitor-exit v0

    return-object v1

    :catchall_17
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;[I)Landroid/graphics/PorterDuffColorFilter;
    .registers 4

    if-eqz p0, :cond_f

    if-nez p1, :cond_5

    goto :goto_f

    :cond_5
    const/4 v0, 0x0

    .line 78
    invoke-virtual {p0, p2, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p0

    .line 79
    invoke-static {p0, p1}, Lb/b/q/w;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object p0

    return-object p0

    :cond_f
    :goto_f
    const/4 p0, 0x0

    return-object p0
.end method

.method public static declared-synchronized a()Lb/b/q/w;
    .registers 2

    const-class v0, Lb/b/q/w;

    monitor-enter v0

    .line 1
    :try_start_3
    sget-object v1, Lb/b/q/w;->i:Lb/b/q/w;

    if-nez v1, :cond_11

    .line 2
    new-instance v1, Lb/b/q/w;

    invoke-direct {v1}, Lb/b/q/w;-><init>()V

    sput-object v1, Lb/b/q/w;->i:Lb/b/q/w;

    .line 3
    invoke-static {v1}, Lb/b/q/w;->a(Lb/b/q/w;)V

    .line 4
    :cond_11
    sget-object v1, Lb/b/q/w;->i:Lb/b/q/w;
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_15

    monitor-exit v0

    return-object v1

    :catchall_15
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static a(Landroid/graphics/drawable/Drawable;Lb/b/q/e0;[I)V
    .registers 5

    .line 68
    invoke-static {p0}, Lb/b/q/q;->a(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 69
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eq v0, p0, :cond_14

    const-string p0, "ResourceManagerInternal"

    const-string p1, "Mutated drawable is not the same instance as the input."

    .line 70
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 71
    :cond_14
    iget-boolean v0, p1, Lb/b/q/e0;->d:Z

    if-nez v0, :cond_21

    iget-boolean v0, p1, Lb/b/q/e0;->c:Z

    if-eqz v0, :cond_1d

    goto :goto_21

    .line 72
    :cond_1d
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    goto :goto_39

    .line 73
    :cond_21
    :goto_21
    iget-boolean v0, p1, Lb/b/q/e0;->d:Z

    if-eqz v0, :cond_28

    iget-object v0, p1, Lb/b/q/e0;->a:Landroid/content/res/ColorStateList;

    goto :goto_29

    :cond_28
    const/4 v0, 0x0

    .line 74
    :goto_29
    iget-boolean v1, p1, Lb/b/q/e0;->c:Z

    if-eqz v1, :cond_30

    iget-object p1, p1, Lb/b/q/e0;->b:Landroid/graphics/PorterDuff$Mode;

    goto :goto_32

    :cond_30
    sget-object p1, Lb/b/q/w;->h:Landroid/graphics/PorterDuff$Mode;

    .line 75
    :goto_32
    invoke-static {v0, p1, p2}, Lb/b/q/w;->a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;[I)Landroid/graphics/PorterDuffColorFilter;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 76
    :goto_39
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x17

    if-gt p1, p2, :cond_42

    .line 77
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_42
    return-void
.end method

.method public static a(Lb/b/q/w;)V
    .registers 3

    .line 5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-ge v0, v1, :cond_2e

    .line 6
    new-instance v0, Lb/b/q/w$g;

    invoke-direct {v0}, Lb/b/q/w$g;-><init>()V

    const-string v1, "vector"

    invoke-virtual {p0, v1, v0}, Lb/b/q/w;->a(Ljava/lang/String;Lb/b/q/w$e;)V

    .line 7
    new-instance v0, Lb/b/q/w$b;

    invoke-direct {v0}, Lb/b/q/w$b;-><init>()V

    const-string v1, "animated-vector"

    invoke-virtual {p0, v1, v0}, Lb/b/q/w;->a(Ljava/lang/String;Lb/b/q/w$e;)V

    .line 8
    new-instance v0, Lb/b/q/w$a;

    invoke-direct {v0}, Lb/b/q/w$a;-><init>()V

    const-string v1, "animated-selector"

    invoke-virtual {p0, v1, v0}, Lb/b/q/w;->a(Ljava/lang/String;Lb/b/q/w$e;)V

    .line 9
    new-instance v0, Lb/b/q/w$d;

    invoke-direct {v0}, Lb/b/q/w$d;-><init>()V

    const-string v1, "drawable"

    invoke-virtual {p0, v1, v0}, Lb/b/q/w;->a(Ljava/lang/String;Lb/b/q/w$e;)V

    :cond_2e
    return-void
.end method

.method public static a(Landroid/graphics/drawable/Drawable;)Z
    .registers 2

    .line 90
    instance-of v0, p0, Lb/t/a/a/i;

    if-nez v0, :cond_17

    const-string v0, "android.graphics.drawable.VectorDrawable"

    .line 91
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_15

    goto :goto_17

    :cond_15
    const/4 p0, 0x0

    goto :goto_18

    :cond_17
    :goto_17
    const/4 p0, 0x1

    :goto_18
    return p0
.end method


# virtual methods
.method public a(I)Landroid/graphics/PorterDuff$Mode;
    .registers 3

    .line 61
    iget-object v0, p0, Lb/b/q/w;->g:Lb/b/q/w$f;

    if-nez v0, :cond_6

    const/4 p1, 0x0

    goto :goto_a

    :cond_6
    invoke-interface {v0, p1}, Lb/b/q/w$f;->a(I)Landroid/graphics/PorterDuff$Mode;

    move-result-object p1

    :goto_a
    return-object p1
.end method

.method public final a(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .registers 7

    .line 20
    iget-object v0, p0, Lb/b/q/w;->e:Landroid/util/TypedValue;

    if-nez v0, :cond_b

    .line 21
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    iput-object v0, p0, Lb/b/q/w;->e:Landroid/util/TypedValue;

    .line 22
    :cond_b
    iget-object v0, p0, Lb/b/q/w;->e:Landroid/util/TypedValue;

    .line 23
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p2, v0, v2}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 24
    invoke-static {v0}, Lb/b/q/w;->a(Landroid/util/TypedValue;)J

    move-result-wide v1

    .line 25
    invoke-virtual {p0, p1, v1, v2}, Lb/b/q/w;->a(Landroid/content/Context;J)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-eqz v3, :cond_20

    return-object v3

    .line 26
    :cond_20
    iget-object v3, p0, Lb/b/q/w;->g:Lb/b/q/w$f;

    if-nez v3, :cond_26

    const/4 p2, 0x0

    goto :goto_2a

    .line 27
    :cond_26
    invoke-interface {v3, p0, p1, p2}, Lb/b/q/w$f;->a(Lb/b/q/w;Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    :goto_2a
    if-eqz p2, :cond_34

    .line 28
    iget v0, v0, Landroid/util/TypedValue;->changingConfigurations:I

    invoke-virtual {p2, v0}, Landroid/graphics/drawable/Drawable;->setChangingConfigurations(I)V

    .line 29
    invoke-virtual {p0, p1, v1, v2, p2}, Lb/b/q/w;->a(Landroid/content/Context;JLandroid/graphics/drawable/Drawable;)Z

    :cond_34
    return-object p2
.end method

.method public declared-synchronized a(Landroid/content/Context;IZ)Landroid/graphics/drawable/Drawable;
    .registers 5

    monitor-enter p0

    .line 12
    :try_start_1
    invoke-virtual {p0, p1}, Lb/b/q/w;->a(Landroid/content/Context;)V

    .line 13
    invoke-virtual {p0, p1, p2}, Lb/b/q/w;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_e

    .line 14
    invoke-virtual {p0, p1, p2}, Lb/b/q/w;->a(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :cond_e
    if-nez v0, :cond_14

    .line 15
    invoke-static {p1, p2}, Lb/h/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :cond_14
    if-eqz v0, :cond_1a

    .line 16
    invoke-virtual {p0, p1, p2, p3, v0}, Lb/b/q/w;->a(Landroid/content/Context;IZLandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :cond_1a
    if-eqz v0, :cond_1f

    .line 17
    invoke-static {v0}, Lb/b/q/q;->b(Landroid/graphics/drawable/Drawable;)V
    :try_end_1f
    .catchall {:try_start_1 .. :try_end_1f} :catchall_21

    .line 18
    :cond_1f
    monitor-exit p0

    return-object v0

    :catchall_21
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final a(Landroid/content/Context;IZLandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 6

    .line 30
    invoke-virtual {p0, p1, p2}, Lb/b/q/w;->c(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    if-eqz v0, :cond_21

    .line 31
    invoke-static {p4}, Lb/b/q/q;->a(Landroid/graphics/drawable/Drawable;)Z

    move-result p1

    if-eqz p1, :cond_10

    .line 32
    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p4

    .line 33
    :cond_10
    invoke-static {p4}, Lb/h/f/l/a;->i(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p4

    .line 34
    invoke-static {p4, v0}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 35
    invoke-virtual {p0, p2}, Lb/b/q/w;->a(I)Landroid/graphics/PorterDuff$Mode;

    move-result-object p1

    if-eqz p1, :cond_35

    .line 36
    invoke-static {p4, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    goto :goto_35

    .line 37
    :cond_21
    iget-object v0, p0, Lb/b/q/w;->g:Lb/b/q/w$f;

    if-eqz v0, :cond_2c

    invoke-interface {v0, p1, p2, p4}, Lb/b/q/w$f;->b(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_2c

    goto :goto_35

    .line 38
    :cond_2c
    invoke-virtual {p0, p1, p2, p4}, Lb/b/q/w;->a(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Z

    move-result p1

    if-nez p1, :cond_35

    if-eqz p3, :cond_35

    const/4 p4, 0x0

    :cond_35
    :goto_35
    return-object p4
.end method

.method public final declared-synchronized a(Landroid/content/Context;J)Landroid/graphics/drawable/Drawable;
    .registers 7

    monitor-enter p0

    .line 39
    :try_start_1
    iget-object v0, p0, Lb/b/q/w;->d:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/e/d;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_2d

    const/4 v1, 0x0

    if-nez v0, :cond_e

    .line 40
    monitor-exit p0

    return-object v1

    .line 41
    :cond_e
    :try_start_e
    invoke-virtual {v0, p2, p3}, Lb/e/d;->a(J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_2b

    .line 42
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/Drawable$ConstantState;

    if-eqz v2, :cond_28

    .line 43
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_26
    .catchall {:try_start_e .. :try_end_26} :catchall_2d

    monitor-exit p0

    return-object p1

    .line 44
    :cond_28
    :try_start_28
    invoke-virtual {v0, p2, p3}, Lb/e/d;->c(J)V
    :try_end_2b
    .catchall {:try_start_28 .. :try_end_2b} :catchall_2d

    .line 45
    :cond_2b
    monitor-exit p0

    return-object v1

    :catchall_2d
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized a(Landroid/content/Context;Lb/b/q/l0;I)Landroid/graphics/drawable/Drawable;
    .registers 5

    monitor-enter p0

    .line 53
    :try_start_1
    invoke-virtual {p0, p1, p3}, Lb/b/q/w;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_b

    .line 54
    invoke-virtual {p2, p3}, Lb/b/q/l0;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :cond_b
    if-eqz v0, :cond_14

    const/4 p2, 0x0

    .line 55
    invoke-virtual {p0, p1, p3, p2, v0}, Lb/b/q/w;->a(Landroid/content/Context;IZLandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_17

    monitor-exit p0

    return-object p1

    :cond_14
    const/4 p1, 0x0

    .line 56
    monitor-exit p0

    return-object p1

    :catchall_17
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final a(Landroid/content/Context;)V
    .registers 3

    .line 84
    iget-boolean v0, p0, Lb/b/q/w;->f:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    .line 85
    iput-boolean v0, p0, Lb/b/q/w;->f:Z

    .line 86
    sget v0, Lb/b/n/a;->abc_vector_test:I

    invoke-virtual {p0, p1, v0}, Lb/b/q/w;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_17

    .line 87
    invoke-static {p1}, Lb/b/q/w;->a(Landroid/graphics/drawable/Drawable;)Z

    move-result p1

    if-eqz p1, :cond_17

    return-void

    :cond_17
    const/4 p1, 0x0

    .line 88
    iput-boolean p1, p0, Lb/b/q/w;->f:Z

    .line 89
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "This app has been built with an incorrect configuration. Please configure your build for VectorDrawableCompat."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final a(Landroid/content/Context;ILandroid/content/res/ColorStateList;)V
    .registers 6

    .line 62
    iget-object v0, p0, Lb/b/q/w;->a:Ljava/util/WeakHashMap;

    if-nez v0, :cond_b

    .line 63
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lb/b/q/w;->a:Ljava/util/WeakHashMap;

    .line 64
    :cond_b
    iget-object v0, p0, Lb/b/q/w;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/e/h;

    if-nez v0, :cond_1f

    .line 65
    new-instance v0, Lb/e/h;

    invoke-direct {v0}, Lb/e/h;-><init>()V

    .line 66
    iget-object v1, p0, Lb/b/q/w;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    :cond_1f
    invoke-virtual {v0, p2, p3}, Lb/e/h;->a(ILjava/lang/Object;)V

    return-void
.end method

.method public declared-synchronized a(Lb/b/q/w$f;)V
    .registers 2

    monitor-enter p0

    .line 10
    :try_start_1
    iput-object p1, p0, Lb/b/q/w;->g:Lb/b/q/w$f;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 11
    monitor-exit p0

    return-void

    :catchall_5
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final a(Ljava/lang/String;Lb/b/q/w$e;)V
    .registers 4

    .line 58
    iget-object v0, p0, Lb/b/q/w;->b:Lb/e/g;

    if-nez v0, :cond_b

    .line 59
    new-instance v0, Lb/e/g;

    invoke-direct {v0}, Lb/e/g;-><init>()V

    iput-object v0, p0, Lb/b/q/w;->b:Lb/e/g;

    .line 60
    :cond_b
    iget-object v0, p0, Lb/b/q/w;->b:Lb/e/g;

    invoke-virtual {v0, p1, p2}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public a(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Z
    .registers 5

    .line 57
    iget-object v0, p0, Lb/b/q/w;->g:Lb/b/q/w$f;

    if-eqz v0, :cond_c

    invoke-interface {v0, p1, p2, p3}, Lb/b/q/w$f;->a(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Z

    move-result p1

    if-eqz p1, :cond_c

    const/4 p1, 0x1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    return p1
.end method

.method public final declared-synchronized a(Landroid/content/Context;JLandroid/graphics/drawable/Drawable;)Z
    .registers 7

    monitor-enter p0

    .line 46
    :try_start_1
    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object p4

    if-eqz p4, :cond_26

    .line 47
    iget-object v0, p0, Lb/b/q/w;->d:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/e/d;

    if-nez v0, :cond_1b

    .line 48
    new-instance v0, Lb/e/d;

    invoke-direct {v0}, Lb/e/d;-><init>()V

    .line 49
    iget-object v1, p0, Lb/b/q/w;->d:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    :cond_1b
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p2, p3, p1}, Lb/e/d;->c(JLjava/lang/Object;)V
    :try_end_23
    .catchall {:try_start_1 .. :try_end_23} :catchall_29

    const/4 p1, 0x1

    .line 51
    monitor-exit p0

    return p1

    :cond_26
    const/4 p1, 0x0

    .line 52
    monitor-exit p0

    return p1

    :catchall_29
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .registers 4

    monitor-enter p0

    const/4 v0, 0x0

    .line 1
    :try_start_2
    invoke-virtual {p0, p1, p2, v0}, Lb/b/q/w;->a(Landroid/content/Context;IZ)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_6
    .catchall {:try_start_2 .. :try_end_6} :catchall_8

    monitor-exit p0

    return-object p1

    :catchall_8
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized b(Landroid/content/Context;)V
    .registers 3

    monitor-enter p0

    .line 2
    :try_start_1
    iget-object v0, p0, Lb/b/q/w;->d:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/e/d;

    if-eqz p1, :cond_e

    .line 3
    invoke-virtual {p1}, Lb/e/d;->a()V
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    .line 4
    :cond_e
    monitor-exit p0

    return-void

    :catchall_10
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized c(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .registers 4

    monitor-enter p0

    .line 1
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lb/b/q/w;->d(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    if-nez v0, :cond_18

    .line 2
    iget-object v0, p0, Lb/b/q/w;->g:Lb/b/q/w$f;

    if-nez v0, :cond_d

    const/4 v0, 0x0

    goto :goto_13

    :cond_d
    iget-object v0, p0, Lb/b/q/w;->g:Lb/b/q/w$f;

    invoke-interface {v0, p1, p2}, Lb/b/q/w$f;->a(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    :goto_13
    if-eqz v0, :cond_18

    .line 3
    invoke-virtual {p0, p1, p2, v0}, Lb/b/q/w;->a(Landroid/content/Context;ILandroid/content/res/ColorStateList;)V
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_1a

    .line 4
    :cond_18
    monitor-exit p0

    return-object v0

    :catchall_1a
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final d(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .registers 5

    .line 1
    iget-object v0, p0, Lb/b/q/w;->a:Ljava/util/WeakHashMap;

    const/4 v1, 0x0

    if-eqz v0, :cond_14

    .line 2
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/e/h;

    if-eqz p1, :cond_14

    .line 3
    invoke-virtual {p1, p2}, Lb/e/h;->a(I)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Landroid/content/res/ColorStateList;

    :cond_14
    return-object v1
.end method

.method public final e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .registers 13

    .line 1
    iget-object v0, p0, Lb/b/q/w;->b:Lb/e/g;

    const/4 v1, 0x0

    if-eqz v0, :cond_b2

    invoke-virtual {v0}, Lb/e/g;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_b2

    .line 2
    iget-object v0, p0, Lb/b/q/w;->c:Lb/e/h;

    const-string v2, "appcompat_skip_skip"

    if-eqz v0, :cond_28

    .line 3
    invoke-virtual {v0, p2}, Lb/e/h;->a(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 4
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_27

    if-eqz v0, :cond_2f

    iget-object v3, p0, Lb/b/q/w;->b:Lb/e/g;

    .line 5
    invoke-virtual {v3, v0}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_2f

    :cond_27
    return-object v1

    .line 6
    :cond_28
    new-instance v0, Lb/e/h;

    invoke-direct {v0}, Lb/e/h;-><init>()V

    iput-object v0, p0, Lb/b/q/w;->c:Lb/e/h;

    .line 7
    :cond_2f
    iget-object v0, p0, Lb/b/q/w;->e:Landroid/util/TypedValue;

    if-nez v0, :cond_3a

    .line 8
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    iput-object v0, p0, Lb/b/q/w;->e:Landroid/util/TypedValue;

    .line 9
    :cond_3a
    iget-object v0, p0, Lb/b/q/w;->e:Landroid/util/TypedValue;

    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/4 v3, 0x1

    .line 11
    invoke-virtual {v1, p2, v0, v3}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 12
    invoke-static {v0}, Lb/b/q/w;->a(Landroid/util/TypedValue;)J

    move-result-wide v4

    .line 13
    invoke-virtual {p0, p1, v4, v5}, Lb/b/q/w;->a(Landroid/content/Context;J)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    if-eqz v6, :cond_4f

    return-object v6

    .line 14
    :cond_4f
    iget-object v7, v0, Landroid/util/TypedValue;->string:Ljava/lang/CharSequence;

    if-eqz v7, :cond_aa

    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, ".xml"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_aa

    .line 15
    :try_start_5f
    invoke-virtual {v1, p2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v1

    .line 16
    invoke-static {v1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v7

    .line 17
    :goto_67
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v8

    const/4 v9, 0x2

    if-eq v8, v9, :cond_71

    if-eq v8, v3, :cond_71

    goto :goto_67

    :cond_71
    if-ne v8, v9, :cond_9a

    .line 18
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 19
    iget-object v8, p0, Lb/b/q/w;->c:Lb/e/h;

    invoke-virtual {v8, p2, v3}, Lb/e/h;->a(ILjava/lang/Object;)V

    .line 20
    iget-object v8, p0, Lb/b/q/w;->b:Lb/e/g;

    invoke-virtual {v8, v3}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/b/q/w$e;

    if-eqz v3, :cond_8f

    .line 21
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v8

    .line 22
    invoke-interface {v3, p1, v1, v7, v8}, Lb/b/q/w$e;->a(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    move-object v6, v1

    :cond_8f
    if-eqz v6, :cond_aa

    .line 23
    iget v0, v0, Landroid/util/TypedValue;->changingConfigurations:I

    invoke-virtual {v6, v0}, Landroid/graphics/drawable/Drawable;->setChangingConfigurations(I)V

    .line 24
    invoke-virtual {p0, p1, v4, v5, v6}, Lb/b/q/w;->a(Landroid/content/Context;JLandroid/graphics/drawable/Drawable;)Z

    goto :goto_aa

    .line 25
    :cond_9a
    new-instance p1, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v0, "No start tag found"

    invoke-direct {p1, v0}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_a2
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_a2} :catch_a2

    :catch_a2
    move-exception p1

    const-string v0, "ResourceManagerInternal"

    const-string v1, "Exception while inflating drawable"

    .line 26
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_aa
    :goto_aa
    if-nez v6, :cond_b1

    .line 27
    iget-object p1, p0, Lb/b/q/w;->c:Lb/e/h;

    invoke-virtual {p1, p2, v2}, Lb/e/h;->a(ILjava/lang/Object;)V

    :cond_b1
    return-object v6

    :cond_b2
    return-object v1
.end method
