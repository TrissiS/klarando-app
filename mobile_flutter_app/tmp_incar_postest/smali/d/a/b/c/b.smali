.class public Ld/a/b/c/b;
.super Ljava/lang/Object;
.source "SingleClickAspect.java"


# static fields
.field public static synthetic c:Ljava/lang/Throwable;

.field public static final synthetic d:Ld/a/b/c/b;


# instance fields
.field public a:J

.field public b:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    :try_start_0
    invoke-static {}, Ld/a/b/c/b;->a()V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_4

    goto :goto_7

    :catchall_4
    move-exception v0

    sput-object v0, Ld/a/b/c/b;->c:Ljava/lang/Throwable;

    :goto_7
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Ld/a/b/c/b;)Ljava/lang/String;
    .registers 1

    .line 1
    iget-object p0, p0, Ld/a/b/c/b;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static synthetic a()V
    .registers 1

    .line 4
    new-instance v0, Ld/a/b/c/b;

    invoke-direct {v0}, Ld/a/b/c/b;-><init>()V

    sput-object v0, Ld/a/b/c/b;->d:Ld/a/b/c/b;

    return-void
.end method

.method public static synthetic a(Ld/a/b/c/b;J)V
    .registers 3

    .line 3
    iput-wide p1, p0, Ld/a/b/c/b;->a:J

    return-void
.end method

.method public static synthetic a(Ld/a/b/c/b;Ljava/lang/String;)V
    .registers 2

    .line 2
    iput-object p1, p0, Ld/a/b/c/b;->b:Ljava/lang/String;

    return-void
.end method

.method public static synthetic b(Ld/a/b/c/b;)J
    .registers 3

    .line 1
    iget-wide v0, p0, Ld/a/b/c/b;->a:J

    return-wide v0
.end method

.method public static b()Ld/a/b/c/b;
    .registers 3

    .line 2
    sget-object v0, Ld/a/b/c/b;->d:Ld/a/b/c/b;

    if-eqz v0, :cond_5

    return-object v0

    :cond_5
    new-instance v0, Le/a/a/b;

    sget-object v1, Ld/a/b/c/b;->c:Ljava/lang/Throwable;

    const-string v2, "net.nyx.postest.aop.SingleClickAspect"

    invoke-direct {v0, v2, v1}, Le/a/a/b;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method
