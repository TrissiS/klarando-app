.class public abstract Ld/a/b/g/l/c/f;
.super Ljava/lang/Object;
.source "DownloadWorker.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static k:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ld/a/b/g/l/c/f;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public h:Ld/a/b/g/l/d/c;

.field public i:Ld/a/b/g/l/f/b;

.field public j:Ld/a/b/g/l/a;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Ld/a/b/g/l/c/f;->k:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Ld/a/b/g/l/c/f;)Ld/a/b/g/l/d/c;
    .registers 1

    .line 1
    iget-object p0, p0, Ld/a/b/g/l/c/f;->h:Ld/a/b/g/l/d/c;

    return-object p0
.end method

.method public static synthetic b()Ljava/util/Map;
    .registers 1

    .line 1
    sget-object v0, Ld/a/b/g/l/c/f;->k:Ljava/util/Map;

    return-object v0
.end method


# virtual methods
.method public final a()V
    .registers 3

    .line 10
    iget-object v0, p0, Ld/a/b/g/l/c/f;->h:Ld/a/b/g/l/d/c;

    if-nez v0, :cond_5

    return-void

    .line 11
    :cond_5
    invoke-static {}, Ld/a/b/g/l/g/e;->a()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Ld/a/b/g/l/c/f$a;

    invoke-direct {v1, p0}, Ld/a/b/g/l/c/f$a;-><init>(Ld/a/b/g/l/c/f;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final a(JJ)V
    .registers 13

    .line 12
    iget-object v0, p0, Ld/a/b/g/l/c/f;->h:Ld/a/b/g/l/d/c;

    if-nez v0, :cond_5

    return-void

    .line 13
    :cond_5
    invoke-static {}, Ld/a/b/g/l/g/e;->a()Landroid/os/Handler;

    move-result-object v0

    new-instance v7, Ld/a/b/g/l/c/f$b;

    move-object v1, v7

    move-object v2, p0

    move-wide v3, p1

    move-wide v5, p3

    invoke-direct/range {v1 .. v6}, Ld/a/b/g/l/c/f$b;-><init>(Ld/a/b/g/l/c/f;JJ)V

    invoke-virtual {v0, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final a(Ld/a/b/g/l/a;)V
    .registers 2

    .line 3
    iput-object p1, p0, Ld/a/b/g/l/c/f;->j:Ld/a/b/g/l/a;

    return-void
.end method

.method public final a(Ld/a/b/g/l/d/c;)V
    .registers 2

    .line 4
    iput-object p1, p0, Ld/a/b/g/l/c/f;->h:Ld/a/b/g/l/d/c;

    return-void
.end method

.method public final a(Ld/a/b/g/l/f/b;)V
    .registers 2

    .line 2
    iput-object p1, p0, Ld/a/b/g/l/c/f;->i:Ld/a/b/g/l/f/b;

    return-void
.end method

.method public final a(Ljava/io/File;)V
    .registers 5

    .line 5
    sget-object v0, Ld/a/b/g/l/c/f;->k:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 6
    sget-object v0, Ld/a/b/g/l/c/f;->k:Ljava/util/Map;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 7
    :cond_e
    new-instance v0, Ljava/lang/RuntimeException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 8
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    const-string p1, "You can not download the same file using multiple download tasks simultaneously\uff0cthe file path is %s"

    .line 9
    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public abstract a(Ljava/lang/String;Ljava/io/File;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public final a(Ljava/lang/Throwable;)V
    .registers 4

    .line 14
    iget-object v0, p0, Ld/a/b/g/l/c/f;->h:Ld/a/b/g/l/d/c;

    if-nez v0, :cond_5

    return-void

    .line 15
    :cond_5
    invoke-static {}, Ld/a/b/g/l/g/e;->a()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Ld/a/b/g/l/c/f$d;

    invoke-direct {v1, p0, p1}, Ld/a/b/g/l/c/f$d;-><init>(Ld/a/b/g/l/c/f;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final b(Ljava/io/File;)V
    .registers 4

    .line 2
    :try_start_0
    iget-object v0, p0, Ld/a/b/g/l/c/f;->j:Ld/a/b/g/l/a;

    invoke-virtual {v0}, Ld/a/b/g/l/a;->j()Ld/a/b/g/l/c/g;

    move-result-object v0

    invoke-virtual {v0}, Ld/a/b/g/l/c/g;->c()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_1b

    .line 3
    iget-object v0, p0, Ld/a/b/g/l/c/f;->h:Ld/a/b/g/l/d/c;

    if-nez v0, :cond_e

    return-void

    .line 4
    :cond_e
    invoke-static {}, Ld/a/b/g/l/g/e;->a()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Ld/a/b/g/l/c/f$c;

    invoke-direct {v1, p0, p1}, Ld/a/b/g/l/c/f$c;-><init>(Ld/a/b/g/l/c/f;Ljava/io/File;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catch_1b
    move-exception p1

    .line 5
    invoke-virtual {p0, p1}, Ld/a/b/g/l/c/f;->a(Ljava/lang/Throwable;)V

    return-void
.end method

.method public final run()V
    .registers 4

    .line 1
    :try_start_0
    iget-object v0, p0, Ld/a/b/g/l/c/f;->j:Ld/a/b/g/l/a;

    invoke-virtual {v0}, Ld/a/b/g/l/a;->k()Ld/a/b/g/l/c/h;

    move-result-object v0

    iget-object v1, p0, Ld/a/b/g/l/c/f;->i:Ld/a/b/g/l/f/b;

    iget-object v2, p0, Ld/a/b/g/l/c/f;->j:Ld/a/b/g/l/a;

    invoke-virtual {v0, v1, v2}, Ld/a/b/g/l/c/h;->a(Ld/a/b/g/l/f/b;Ld/a/b/g/l/a;)Ljava/io/File;

    move-result-object v0

    .line 2
    iget-object v1, p0, Ld/a/b/g/l/c/f;->j:Ld/a/b/g/l/a;

    invoke-virtual {v1}, Ld/a/b/g/l/a;->j()Ld/a/b/g/l/c/g;

    move-result-object v1

    .line 3
    iget-object v2, p0, Ld/a/b/g/l/c/f;->i:Ld/a/b/g/l/f/b;

    invoke-virtual {v1, v2, v0}, Ld/a/b/g/l/c/g;->a(Ld/a/b/g/l/f/b;Ljava/io/File;)V

    .line 4
    iget-object v1, p0, Ld/a/b/g/l/c/f;->j:Ld/a/b/g/l/a;

    invoke-virtual {v1}, Ld/a/b/g/l/a;->j()Ld/a/b/g/l/c/g;

    move-result-object v1

    invoke-virtual {v1}, Ld/a/b/g/l/c/g;->a()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 5
    iget-object v1, p0, Ld/a/b/g/l/c/f;->h:Ld/a/b/g/l/d/c;

    invoke-virtual {v1, v0}, Ld/a/b/g/l/d/c;->b(Ljava/io/File;)V

    return-void

    .line 6
    :cond_2b
    invoke-virtual {p0, v0}, Ld/a/b/g/l/c/f;->a(Ljava/io/File;)V

    .line 7
    invoke-virtual {p0}, Ld/a/b/g/l/c/f;->a()V

    .line 8
    iget-object v1, p0, Ld/a/b/g/l/c/f;->i:Ld/a/b/g/l/f/b;

    invoke-virtual {v1}, Ld/a/b/g/l/f/b;->d()Ljava/lang/String;

    move-result-object v1

    .line 9
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 10
    invoke-virtual {p0, v1, v0}, Ld/a/b/g/l/c/f;->a(Ljava/lang/String;Ljava/io/File;)V
    :try_end_41
    .catchall {:try_start_0 .. :try_end_41} :catchall_42

    goto :goto_46

    :catchall_42
    move-exception v0

    .line 11
    invoke-virtual {p0, v0}, Ld/a/b/g/l/c/f;->a(Ljava/lang/Throwable;)V

    :goto_46
    return-void
.end method
