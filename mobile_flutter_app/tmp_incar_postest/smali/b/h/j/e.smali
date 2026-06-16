.class public Lb/h/j/e;
.super Ljava/lang/Object;
.source "FontRequestWorker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/h/j/e$e;
    }
.end annotation


# static fields
.field public static final a:Lb/e/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/e<",
            "Ljava/lang/String;",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field

.field public static final b:Ljava/util/concurrent/ExecutorService;

.field public static final c:Ljava/lang/Object;

.field public static final d:Lb/e/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/g<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lb/h/l/a<",
            "Lb/h/j/e$e;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    .line 1
    new-instance v0, Lb/e/e;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Lb/e/e;-><init>(I)V

    sput-object v0, Lb/h/j/e;->a:Lb/e/e;

    const-string v0, "fonts-androidx"

    const/16 v1, 0xa

    const/16 v2, 0x2710

    .line 2
    invoke-static {v0, v1, v2}, Lb/h/j/g;->a(Ljava/lang/String;II)Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v0

    sput-object v0, Lb/h/j/e;->b:Ljava/util/concurrent/ExecutorService;

    .line 3
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lb/h/j/e;->c:Ljava/lang/Object;

    .line 4
    new-instance v0, Lb/e/g;

    invoke-direct {v0}, Lb/e/g;-><init>()V

    sput-object v0, Lb/h/j/e;->d:Lb/e/g;

    return-void
.end method

.method public static a(Lb/h/j/f$a;)I
    .registers 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 40
    invoke-virtual {p0}, Lb/h/j/f$a;->b()I

    move-result v0

    const/4 v1, -0x3

    const/4 v2, 0x1

    if-eqz v0, :cond_11

    .line 41
    invoke-virtual {p0}, Lb/h/j/f$a;->b()I

    move-result p0

    if-eq p0, v2, :cond_f

    return v1

    :cond_f
    const/4 p0, -0x2

    return p0

    .line 42
    :cond_11
    invoke-virtual {p0}, Lb/h/j/f$a;->a()[Lb/h/j/f$b;

    move-result-object p0

    if-eqz p0, :cond_30

    .line 43
    array-length v0, p0

    if-nez v0, :cond_1b

    goto :goto_30

    .line 44
    :cond_1b
    array-length v0, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_1e
    if-ge v3, v0, :cond_30

    aget-object v4, p0, v3

    .line 45
    invoke-virtual {v4}, Lb/h/j/f$b;->a()I

    move-result v4

    if-eqz v4, :cond_2d

    if-gez v4, :cond_2b

    goto :goto_2c

    :cond_2b
    move v1, v4

    :goto_2c
    return v1

    :cond_2d
    add-int/lit8 v3, v3, 0x1

    goto :goto_1e

    :cond_30
    :goto_30
    return v2
.end method

.method public static a(Landroid/content/Context;Lb/h/j/d;ILjava/util/concurrent/Executor;Lb/h/j/a;)Landroid/graphics/Typeface;
    .registers 9

    .line 12
    invoke-static {p1, p2}, Lb/h/j/e;->a(Lb/h/j/d;I)Ljava/lang/String;

    move-result-object v0

    .line 13
    sget-object v1, Lb/h/j/e;->a:Lb/e/e;

    invoke-virtual {v1, v0}, Lb/e/e;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Typeface;

    if-eqz v1, :cond_17

    .line 14
    new-instance p0, Lb/h/j/e$e;

    invoke-direct {p0, v1}, Lb/h/j/e$e;-><init>(Landroid/graphics/Typeface;)V

    invoke-virtual {p4, p0}, Lb/h/j/a;->a(Lb/h/j/e$e;)V

    return-object v1

    .line 15
    :cond_17
    new-instance v1, Lb/h/j/e$b;

    invoke-direct {v1, p4}, Lb/h/j/e$b;-><init>(Lb/h/j/a;)V

    .line 16
    sget-object p4, Lb/h/j/e;->c:Ljava/lang/Object;

    monitor-enter p4

    .line 17
    :try_start_1f
    sget-object v2, Lb/h/j/e;->d:Lb/e/g;

    invoke-virtual {v2, v0}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    const/4 v3, 0x0

    if-eqz v2, :cond_2f

    .line 18
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    monitor-exit p4

    return-object v3

    .line 20
    :cond_2f
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 21
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    sget-object v1, Lb/h/j/e;->d:Lb/e/g;

    invoke-virtual {v1, v0, v2}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    monitor-exit p4
    :try_end_3d
    .catchall {:try_start_1f .. :try_end_3d} :catchall_4f

    .line 24
    new-instance p4, Lb/h/j/e$c;

    invoke-direct {p4, v0, p0, p1, p2}, Lb/h/j/e$c;-><init>(Ljava/lang/String;Landroid/content/Context;Lb/h/j/d;I)V

    if-nez p3, :cond_46

    .line 25
    sget-object p3, Lb/h/j/e;->b:Ljava/util/concurrent/ExecutorService;

    .line 26
    :cond_46
    new-instance p0, Lb/h/j/e$d;

    invoke-direct {p0, v0}, Lb/h/j/e$d;-><init>(Ljava/lang/String;)V

    invoke-static {p3, p4, p0}, Lb/h/j/g;->a(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;Lb/h/l/a;)V

    return-object v3

    :catchall_4f
    move-exception p0

    .line 27
    :try_start_50
    monitor-exit p4
    :try_end_51
    .catchall {:try_start_50 .. :try_end_51} :catchall_4f

    throw p0
.end method

.method public static a(Landroid/content/Context;Lb/h/j/d;Lb/h/j/a;II)Landroid/graphics/Typeface;
    .registers 7

    .line 1
    invoke-static {p1, p3}, Lb/h/j/e;->a(Lb/h/j/d;I)Ljava/lang/String;

    move-result-object v0

    .line 2
    sget-object v1, Lb/h/j/e;->a:Lb/e/e;

    invoke-virtual {v1, v0}, Lb/e/e;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Typeface;

    if-eqz v1, :cond_17

    .line 3
    new-instance p0, Lb/h/j/e$e;

    invoke-direct {p0, v1}, Lb/h/j/e$e;-><init>(Landroid/graphics/Typeface;)V

    invoke-virtual {p2, p0}, Lb/h/j/a;->a(Lb/h/j/e$e;)V

    return-object v1

    :cond_17
    const/4 v1, -0x1

    if-ne p4, v1, :cond_24

    .line 4
    invoke-static {v0, p0, p1, p3}, Lb/h/j/e;->a(Ljava/lang/String;Landroid/content/Context;Lb/h/j/d;I)Lb/h/j/e$e;

    move-result-object p0

    .line 5
    invoke-virtual {p2, p0}, Lb/h/j/a;->a(Lb/h/j/e$e;)V

    .line 6
    iget-object p0, p0, Lb/h/j/e$e;->a:Landroid/graphics/Typeface;

    return-object p0

    .line 7
    :cond_24
    new-instance v1, Lb/h/j/e$a;

    invoke-direct {v1, v0, p0, p1, p3}, Lb/h/j/e$a;-><init>(Ljava/lang/String;Landroid/content/Context;Lb/h/j/d;I)V

    .line 8
    :try_start_29
    sget-object p0, Lb/h/j/e;->b:Ljava/util/concurrent/ExecutorService;

    invoke-static {p0, v1, p4}, Lb/h/j/g;->a(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/Callable;I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb/h/j/e$e;

    .line 9
    invoke-virtual {p2, p0}, Lb/h/j/a;->a(Lb/h/j/e$e;)V

    .line 10
    iget-object p0, p0, Lb/h/j/e$e;->a:Landroid/graphics/Typeface;
    :try_end_36
    .catch Ljava/lang/InterruptedException; {:try_start_29 .. :try_end_36} :catch_37

    return-object p0

    .line 11
    :catch_37
    new-instance p0, Lb/h/j/e$e;

    const/4 p1, -0x3

    invoke-direct {p0, p1}, Lb/h/j/e$e;-><init>(I)V

    invoke-virtual {p2, p0}, Lb/h/j/a;->a(Lb/h/j/e$e;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Ljava/lang/String;Landroid/content/Context;Lb/h/j/d;I)Lb/h/j/e$e;
    .registers 6

    .line 29
    sget-object v0, Lb/h/j/e;->a:Lb/e/e;

    invoke-virtual {v0, p0}, Lb/e/e;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Typeface;

    if-eqz v0, :cond_10

    .line 30
    new-instance p0, Lb/h/j/e$e;

    invoke-direct {p0, v0}, Lb/h/j/e$e;-><init>(Landroid/graphics/Typeface;)V

    return-object p0

    :cond_10
    const/4 v0, 0x0

    .line 31
    :try_start_11
    invoke-static {p1, p2, v0}, Lb/h/j/c;->a(Landroid/content/Context;Lb/h/j/d;Landroid/os/CancellationSignal;)Lb/h/j/f$a;

    move-result-object p2
    :try_end_15
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_11 .. :try_end_15} :catch_3d

    .line 32
    invoke-static {p2}, Lb/h/j/e;->a(Lb/h/j/f$a;)I

    move-result v1

    if-eqz v1, :cond_21

    .line 33
    new-instance p0, Lb/h/j/e$e;

    invoke-direct {p0, v1}, Lb/h/j/e$e;-><init>(I)V

    return-object p0

    .line 34
    :cond_21
    invoke-virtual {p2}, Lb/h/j/f$a;->a()[Lb/h/j/f$b;

    move-result-object p2

    .line 35
    invoke-static {p1, v0, p2, p3}, Lb/h/f/d;->a(Landroid/content/Context;Landroid/os/CancellationSignal;[Lb/h/j/f$b;I)Landroid/graphics/Typeface;

    move-result-object p1

    if-eqz p1, :cond_36

    .line 36
    sget-object p2, Lb/h/j/e;->a:Lb/e/e;

    invoke-virtual {p2, p0, p1}, Lb/e/e;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    new-instance p0, Lb/h/j/e$e;

    invoke-direct {p0, p1}, Lb/h/j/e$e;-><init>(Landroid/graphics/Typeface;)V

    return-object p0

    .line 38
    :cond_36
    new-instance p0, Lb/h/j/e$e;

    const/4 p1, -0x3

    invoke-direct {p0, p1}, Lb/h/j/e$e;-><init>(I)V

    return-object p0

    .line 39
    :catch_3d
    new-instance p0, Lb/h/j/e$e;

    const/4 p1, -0x1

    invoke-direct {p0, p1}, Lb/h/j/e$e;-><init>(I)V

    return-object p0
.end method

.method public static a(Lb/h/j/d;I)Ljava/lang/String;
    .registers 3

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lb/h/j/d;->c()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "-"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
