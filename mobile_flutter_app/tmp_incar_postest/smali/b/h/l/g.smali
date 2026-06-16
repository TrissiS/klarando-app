.class public Lb/h/l/g;
.super Lb/h/l/f;
.source "Pools.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lb/h/l/f<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Lb/h/l/f;-><init>(I)V

    .line 2
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb/h/l/g;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/h/l/g;->c:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_3
    invoke-super {p0}, Lb/h/l/f;->a()Ljava/lang/Object;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_9
    move-exception v1

    .line 3
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_9

    throw v1
.end method

.method public a(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 4
    iget-object v0, p0, Lb/h/l/g;->c:Ljava/lang/Object;

    monitor-enter v0

    .line 5
    :try_start_3
    invoke-super {p0, p1}, Lb/h/l/f;->a(Ljava/lang/Object;)Z

    move-result p1

    monitor-exit v0

    return p1

    :catchall_9
    move-exception p1

    .line 6
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_9

    throw p1
.end method
