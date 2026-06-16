.class public Lb/c/a/a/a;
.super Lb/c/a/a/c;
.source "ArchTaskExecutor.java"


# static fields
.field public static volatile c:Lb/c/a/a/a;


# instance fields
.field public a:Lb/c/a/a/c;

.field public b:Lb/c/a/a/c;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Lb/c/a/a/a$a;

    invoke-direct {v0}, Lb/c/a/a/a$a;-><init>()V

    .line 2
    new-instance v0, Lb/c/a/a/a$b;

    invoke-direct {v0}, Lb/c/a/a/a$b;-><init>()V

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lb/c/a/a/c;-><init>()V

    .line 2
    new-instance v0, Lb/c/a/a/b;

    invoke-direct {v0}, Lb/c/a/a/b;-><init>()V

    iput-object v0, p0, Lb/c/a/a/a;->b:Lb/c/a/a/c;

    .line 3
    iput-object v0, p0, Lb/c/a/a/a;->a:Lb/c/a/a/c;

    return-void
.end method

.method public static b()Lb/c/a/a/a;
    .registers 2

    .line 1
    sget-object v0, Lb/c/a/a/a;->c:Lb/c/a/a/a;

    if-eqz v0, :cond_7

    .line 2
    sget-object v0, Lb/c/a/a/a;->c:Lb/c/a/a/a;

    return-object v0

    .line 3
    :cond_7
    const-class v0, Lb/c/a/a/a;

    monitor-enter v0

    .line 4
    :try_start_a
    sget-object v1, Lb/c/a/a/a;->c:Lb/c/a/a/a;

    if-nez v1, :cond_15

    .line 5
    new-instance v1, Lb/c/a/a/a;

    invoke-direct {v1}, Lb/c/a/a/a;-><init>()V

    sput-object v1, Lb/c/a/a/a;->c:Lb/c/a/a/a;

    .line 6
    :cond_15
    monitor-exit v0
    :try_end_16
    .catchall {:try_start_a .. :try_end_16} :catchall_19

    .line 7
    sget-object v0, Lb/c/a/a/a;->c:Lb/c/a/a/a;

    return-object v0

    :catchall_19
    move-exception v1

    .line 8
    :try_start_1a
    monitor-exit v0
    :try_end_1b
    .catchall {:try_start_1a .. :try_end_1b} :catchall_19

    throw v1
.end method


# virtual methods
.method public a(Ljava/lang/Runnable;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/c/a/a/a;->a:Lb/c/a/a/c;

    invoke-virtual {v0, p1}, Lb/c/a/a/c;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public a()Z
    .registers 2

    .line 2
    iget-object v0, p0, Lb/c/a/a/a;->a:Lb/c/a/a/c;

    invoke-virtual {v0}, Lb/c/a/a/c;->a()Z

    move-result v0

    return v0
.end method

.method public b(Ljava/lang/Runnable;)V
    .registers 3

    .line 9
    iget-object v0, p0, Lb/c/a/a/a;->a:Lb/c/a/a/c;

    invoke-virtual {v0, p1}, Lb/c/a/a/c;->b(Ljava/lang/Runnable;)V

    return-void
.end method
