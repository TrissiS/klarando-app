.class public final Ld/a/b/g/l/d/a;
.super Ljava/lang/Object;
.source "CallbackDelegate.java"

# interfaces
.implements Ld/a/b/g/l/c/a;
.implements Ld/a/b/g/l/c/d;


# instance fields
.field public a:Ld/a/b/g/l/c/a;

.field public b:Ld/a/b/g/l/c/d;

.field public c:Ld/a/b/g/l/c/k;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 3

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "There are no new version exist"

    .line 23
    invoke-static {v1, v0}, Ld/a/b/g/l/g/b;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 24
    iget-object v0, p0, Ld/a/b/g/l/d/a;->a:Ld/a/b/g/l/c/a;

    if-eqz v0, :cond_f

    .line 25
    invoke-interface {v0}, Ld/a/b/g/l/c/a;->a()V

    .line 26
    :cond_f
    iget-object v0, p0, Ld/a/b/g/l/d/a;->c:Ld/a/b/g/l/c/k;

    if-eqz v0, :cond_16

    .line 27
    invoke-virtual {v0}, Ld/a/b/g/l/c/k;->a()V

    :cond_16
    return-void
.end method

.method public a(JJ)V
    .registers 8

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    .line 8
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "Downloading... current is %s and total is %s"

    invoke-static {v1, v0}, Ld/a/b/g/l/g/b;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 9
    iget-object v0, p0, Ld/a/b/g/l/d/a;->b:Ld/a/b/g/l/c/d;

    if-eqz v0, :cond_1d

    .line 10
    invoke-interface {v0, p1, p2, p3, p4}, Ld/a/b/g/l/c/d;->a(JJ)V

    .line 11
    :cond_1d
    iget-object v0, p0, Ld/a/b/g/l/d/a;->c:Ld/a/b/g/l/c/k;

    if-eqz v0, :cond_24

    .line 12
    invoke-virtual {v0, p1, p2, p3, p4}, Ld/a/b/g/l/c/k;->a(JJ)V

    :cond_24
    return-void
.end method

.method public a(Ld/a/b/g/l/c/a;)V
    .registers 2

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/d/a;->a:Ld/a/b/g/l/c/a;

    return-void
.end method

.method public a(Ld/a/b/g/l/c/d;)V
    .registers 2

    .line 2
    iput-object p1, p0, Ld/a/b/g/l/d/a;->b:Ld/a/b/g/l/c/d;

    return-void
.end method

.method public a(Ld/a/b/g/l/f/b;)V
    .registers 4

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string v1, "Checkout that new version apk is exist: update is %s"

    .line 18
    invoke-static {v1, v0}, Ld/a/b/g/l/g/b;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 19
    iget-object v0, p0, Ld/a/b/g/l/d/a;->a:Ld/a/b/g/l/c/a;

    if-eqz v0, :cond_12

    .line 20
    invoke-interface {v0, p1}, Ld/a/b/g/l/c/a;->a(Ld/a/b/g/l/f/b;)V

    .line 21
    :cond_12
    iget-object v0, p0, Ld/a/b/g/l/d/a;->c:Ld/a/b/g/l/c/k;

    if-eqz v0, :cond_19

    .line 22
    invoke-virtual {v0, p1}, Ld/a/b/g/l/c/k;->a(Ld/a/b/g/l/f/b;)V

    :cond_19
    return-void
.end method

.method public a(Ljava/io/File;)V
    .registers 5

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 3
    invoke-virtual {p1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "Download completed to file [%s]"

    invoke-static {v1, v0}, Ld/a/b/g/l/g/b;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 4
    iget-object v0, p0, Ld/a/b/g/l/d/a;->b:Ld/a/b/g/l/c/d;

    if-eqz v0, :cond_16

    .line 5
    invoke-interface {v0, p1}, Ld/a/b/g/l/c/d;->a(Ljava/io/File;)V

    .line 6
    :cond_16
    iget-object v0, p0, Ld/a/b/g/l/d/a;->c:Ld/a/b/g/l/c/k;

    if-eqz v0, :cond_1d

    .line 7
    invoke-virtual {v0, p1}, Ld/a/b/g/l/c/k;->a(Ljava/io/File;)V

    :cond_1d
    return-void
.end method

.method public a(Ljava/lang/Throwable;)V
    .registers 5

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 13
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "Download task has occurs error: %s"

    invoke-static {p1, v1, v0}, Ld/a/b/g/l/g/b;->a(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    iget-object v0, p0, Ld/a/b/g/l/d/a;->b:Ld/a/b/g/l/c/d;

    if-eqz v0, :cond_16

    .line 15
    invoke-interface {v0, p1}, Ld/a/b/g/l/c/d;->a(Ljava/lang/Throwable;)V

    .line 16
    :cond_16
    iget-object v0, p0, Ld/a/b/g/l/d/a;->c:Ld/a/b/g/l/c/k;

    if-eqz v0, :cond_1d

    .line 17
    invoke-virtual {v0, p1}, Ld/a/b/g/l/c/k;->a(Ljava/lang/Throwable;)V

    :cond_1d
    return-void
.end method

.method public b()V
    .registers 3

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "start downloading\u3002\u3002\u3002"

    .line 1
    invoke-static {v1, v0}, Ld/a/b/g/l/g/b;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/d/a;->b:Ld/a/b/g/l/c/d;

    if-eqz v0, :cond_f

    .line 3
    invoke-interface {v0}, Ld/a/b/g/l/c/d;->b()V

    .line 4
    :cond_f
    iget-object v0, p0, Ld/a/b/g/l/d/a;->c:Ld/a/b/g/l/c/k;

    if-eqz v0, :cond_16

    .line 5
    invoke-virtual {v0}, Ld/a/b/g/l/c/k;->b()V

    :cond_16
    return-void
.end method

.method public b(Ld/a/b/g/l/f/b;)V
    .registers 4

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ignored for this update: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ld/a/b/g/l/g/b;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 12
    iget-object v0, p0, Ld/a/b/g/l/d/a;->a:Ld/a/b/g/l/c/a;

    if-eqz v0, :cond_1e

    .line 13
    invoke-interface {v0, p1}, Ld/a/b/g/l/c/a;->b(Ld/a/b/g/l/f/b;)V

    .line 14
    :cond_1e
    iget-object v0, p0, Ld/a/b/g/l/d/a;->c:Ld/a/b/g/l/c/k;

    if-eqz v0, :cond_25

    .line 15
    invoke-virtual {v0, p1}, Ld/a/b/g/l/c/k;->b(Ld/a/b/g/l/f/b;)V

    :cond_25
    return-void
.end method

.method public b(Ljava/lang/Throwable;)V
    .registers 5

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 6
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "check update failed: cause by : %s"

    invoke-static {p1, v1, v0}, Ld/a/b/g/l/g/b;->a(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 7
    iget-object v0, p0, Ld/a/b/g/l/d/a;->a:Ld/a/b/g/l/c/a;

    if-eqz v0, :cond_16

    .line 8
    invoke-interface {v0, p1}, Ld/a/b/g/l/c/a;->b(Ljava/lang/Throwable;)V

    .line 9
    :cond_16
    iget-object v0, p0, Ld/a/b/g/l/d/a;->c:Ld/a/b/g/l/c/k;

    if-eqz v0, :cond_1d

    .line 10
    invoke-virtual {v0, p1}, Ld/a/b/g/l/c/k;->b(Ljava/lang/Throwable;)V

    :cond_1d
    return-void
.end method

.method public c()V
    .registers 3

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "update task has canceled by user"

    .line 1
    invoke-static {v1, v0}, Ld/a/b/g/l/g/b;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/d/a;->a:Ld/a/b/g/l/c/a;

    if-eqz v0, :cond_f

    .line 3
    invoke-interface {v0}, Ld/a/b/g/l/c/a;->c()V

    .line 4
    :cond_f
    iget-object v0, p0, Ld/a/b/g/l/d/a;->c:Ld/a/b/g/l/c/k;

    if-eqz v0, :cond_16

    .line 5
    invoke-virtual {v0}, Ld/a/b/g/l/c/k;->c()V

    :cond_16
    return-void
.end method

.method public d()V
    .registers 3

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "starting check update task."

    .line 1
    invoke-static {v1, v0}, Ld/a/b/g/l/g/b;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/d/a;->a:Ld/a/b/g/l/c/a;

    if-eqz v0, :cond_f

    .line 3
    invoke-interface {v0}, Ld/a/b/g/l/c/a;->d()V

    .line 4
    :cond_f
    iget-object v0, p0, Ld/a/b/g/l/d/a;->c:Ld/a/b/g/l/c/k;

    if-eqz v0, :cond_16

    .line 5
    invoke-virtual {v0}, Ld/a/b/g/l/c/k;->d()V

    :cond_16
    return-void
.end method
