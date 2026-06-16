.class public abstract Lb/n/q;
.super Ljava/lang/Object;
.source "ViewModel.java"


# instance fields
.field public final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/n/q;->a:Ljava/util/Map;

    return-void
.end method

.method public static a(Ljava/lang/Object;)V
    .registers 2

    .line 11
    instance-of v0, p0, Ljava/io/Closeable;

    if-eqz v0, :cond_11

    .line 12
    :try_start_4
    check-cast p0, Ljava/io/Closeable;

    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_9} :catch_a

    goto :goto_11

    :catch_a
    move-exception p0

    .line 13
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :cond_11
    :goto_11
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 7
    iget-object v0, p0, Lb/n/q;->a:Ljava/util/Map;

    if-nez v0, :cond_6

    const/4 p1, 0x0

    return-object p1

    .line 8
    :cond_6
    monitor-enter v0

    .line 9
    :try_start_7
    iget-object v1, p0, Lb/n/q;->a:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    monitor-exit v0

    return-object p1

    :catchall_f
    move-exception p1

    .line 10
    monitor-exit v0
    :try_end_11
    .catchall {:try_start_7 .. :try_end_11} :catchall_f

    throw p1
.end method

.method public final a()V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/n/q;->a:Ljava/util/Map;

    if-eqz v0, :cond_22

    .line 2
    monitor-enter v0

    .line 3
    :try_start_5
    iget-object v1, p0, Lb/n/q;->a:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 4
    invoke-static {v2}, Lb/n/q;->a(Ljava/lang/Object;)V

    goto :goto_f

    .line 5
    :cond_1d
    monitor-exit v0

    goto :goto_22

    :catchall_1f
    move-exception v1

    monitor-exit v0
    :try_end_21
    .catchall {:try_start_5 .. :try_end_21} :catchall_1f

    throw v1

    .line 6
    :cond_22
    :goto_22
    invoke-virtual {p0}, Lb/n/q;->b()V

    return-void
.end method

.method public b()V
    .registers 1

    return-void
.end method
