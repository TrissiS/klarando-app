.class public final Ld/a/b/g/l/d/d;
.super Ljava/lang/Object;
.source "Launcher.java"


# static fields
.field public static a:Ld/a/b/g/l/d/d;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a()Ld/a/b/g/l/d/d;
    .registers 1

    .line 1
    sget-object v0, Ld/a/b/g/l/d/d;->a:Ld/a/b/g/l/d/d;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Ld/a/b/g/l/d/d;

    invoke-direct {v0}, Ld/a/b/g/l/d/d;-><init>()V

    sput-object v0, Ld/a/b/g/l/d/d;->a:Ld/a/b/g/l/d/d;

    .line 3
    :cond_b
    sget-object v0, Ld/a/b/g/l/d/d;->a:Ld/a/b/g/l/d/d;

    return-object v0
.end method


# virtual methods
.method public a(Ld/a/b/g/l/a;)V
    .registers 6

    .line 4
    new-instance v0, Ld/a/b/g/l/d/b;

    invoke-direct {v0}, Ld/a/b/g/l/d/b;-><init>()V

    .line 5
    invoke-virtual {v0, p1}, Ld/a/b/g/l/d/b;->a(Ld/a/b/g/l/a;)V

    .line 6
    invoke-virtual {v0}, Ld/a/b/g/l/d/b;->d()V

    .line 7
    :try_start_b
    invoke-virtual {p1}, Ld/a/b/g/l/a;->e()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ld/a/b/g/l/c/c;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_15} :catch_27

    .line 8
    invoke-virtual {v1, p1}, Ld/a/b/g/l/c/c;->a(Ld/a/b/g/l/a;)V

    .line 9
    invoke-virtual {v1, v0}, Ld/a/b/g/l/c/c;->a(Ld/a/b/g/l/d/b;)V

    .line 10
    invoke-virtual {p1}, Ld/a/b/g/l/a;->f()Ld/a/b/g/l/b;

    move-result-object p1

    invoke-virtual {p1}, Ld/a/b/g/l/b;->h()Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    invoke-interface {p1, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void

    :catch_27
    move-exception v0

    .line 11
    new-instance v1, Ljava/lang/RuntimeException;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    .line 12
    invoke-virtual {p1}, Ld/a/b/g/l/a;->e()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, v3

    const-string p1, "Could not create instance for %s"

    .line 13
    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public a(Ld/a/b/g/l/f/b;Ld/a/b/g/l/a;)V
    .registers 6

    .line 14
    new-instance v0, Ld/a/b/g/l/d/c;

    invoke-direct {v0}, Ld/a/b/g/l/d/c;-><init>()V

    .line 15
    invoke-virtual {v0, p2}, Ld/a/b/g/l/d/c;->a(Ld/a/b/g/l/a;)V

    .line 16
    invoke-virtual {v0, p1}, Ld/a/b/g/l/d/c;->a(Ld/a/b/g/l/f/b;)V

    .line 17
    :try_start_b
    invoke-virtual {p2}, Ld/a/b/g/l/a;->i()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ld/a/b/g/l/c/f;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_15} :catch_2a

    .line 18
    invoke-virtual {v1, p1}, Ld/a/b/g/l/c/f;->a(Ld/a/b/g/l/f/b;)V

    .line 19
    invoke-virtual {v1, p2}, Ld/a/b/g/l/c/f;->a(Ld/a/b/g/l/a;)V

    .line 20
    invoke-virtual {v1, v0}, Ld/a/b/g/l/c/f;->a(Ld/a/b/g/l/d/c;)V

    .line 21
    invoke-virtual {p2}, Ld/a/b/g/l/a;->f()Ld/a/b/g/l/b;

    move-result-object p1

    invoke-virtual {p1}, Ld/a/b/g/l/b;->h()Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    invoke-interface {p1, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void

    :catch_2a
    move-exception p1

    .line 22
    new-instance v0, Ljava/lang/RuntimeException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 23
    invoke-virtual {p2}, Ld/a/b/g/l/a;->i()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p2

    aput-object p2, v1, v2

    const-string p2, "Could not create instance for %s"

    .line 24
    invoke-static {p2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method
