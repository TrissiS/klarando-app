.class public Ld/a/b/g/l/e/c;
.super Ld/a/b/g/l/c/f;
.source "DefaultDownloadWorker.java"


# instance fields
.field public l:Ljava/net/HttpURLConnection;

.field public m:Ljava/io/File;

.field public n:Ljava/io/File;

.field public o:J


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ld/a/b/g/l/c/f;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/net/URL;)Ljava/io/FileOutputStream;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 28
    iget-object v0, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    const-string v1, "Accept-Ranges"

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_75

    const-string v1, "bytes"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_17

    goto :goto_75

    .line 30
    :cond_17
    iget-object v0, p0, Ld/a/b/g/l/e/c;->n:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    .line 31
    iget-object v2, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 32
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    iput-object p1, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    .line 33
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bytes="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "-"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v0, p0, Ld/a/b/g/l/e/c;->o:J

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "RANGE"

    invoke-virtual {p1, v1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    invoke-virtual {p0}, Ld/a/b/g/l/e/c;->f()V

    .line 35
    iget-object p1, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->connect()V

    .line 36
    iget-object p1, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    const/16 v0, 0xc8

    if-lt p1, v0, :cond_69

    const/16 v0, 0x12c

    if-ge p1, v0, :cond_69

    .line 37
    new-instance p1, Ljava/io/FileOutputStream;

    iget-object v0, p0, Ld/a/b/g/l/e/c;->n:Ljava/io/File;

    const/4 v1, 0x1

    invoke-direct {p1, v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    return-object p1

    .line 38
    :cond_69
    new-instance v0, Ld/a/b/g/l/e/k;

    iget-object v1, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ld/a/b/g/l/e/k;-><init>(ILjava/lang/String;)V

    throw v0

    .line 39
    :cond_75
    :goto_75
    iget-object p1, p0, Ld/a/b/g/l/e/c;->n:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 40
    new-instance p1, Ljava/io/FileOutputStream;

    iget-object v0, p0, Ld/a/b/g/l/e/c;->n:Ljava/io/File;

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    return-object p1
.end method

.method public a(Ljava/lang/String;Ljava/io/File;)V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ld/a/b/g/l/e/c;->m:Ljava/io/File;

    .line 2
    new-instance p2, Ljava/net/URL;

    invoke-direct {p2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 3
    invoke-virtual {p2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    iput-object p1, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    .line 4
    invoke-virtual {p0}, Ld/a/b/g/l/e/c;->f()V

    .line 5
    iget-object p1, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->connect()V

    .line 6
    iget-object p1, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    const/16 v0, 0xc8

    if-lt p1, v0, :cond_8d

    const/16 v0, 0x12c

    if-ge p1, v0, :cond_8d

    .line 7
    iget-object p1, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result p1

    int-to-long v0, p1

    iput-wide v0, p0, Ld/a/b/g/l/e/c;->o:J

    .line 8
    invoke-virtual {p0}, Ld/a/b/g/l/e/c;->c()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_42

    .line 9
    iget-object p1, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 10
    iput-object v0, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    .line 11
    iget-object p1, p0, Ld/a/b/g/l/e/c;->m:Ljava/io/File;

    invoke-virtual {p0, p1}, Ld/a/b/g/l/c/f;->b(Ljava/io/File;)V

    return-void

    .line 12
    :cond_42
    invoke-virtual {p0}, Ld/a/b/g/l/e/c;->d()V

    .line 13
    invoke-virtual {p0, p2}, Ld/a/b/g/l/e/c;->a(Ljava/net/URL;)Ljava/io/FileOutputStream;

    move-result-object p1

    .line 14
    iget-object p2, p0, Ld/a/b/g/l/e/c;->n:Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v1

    .line 15
    iget-object p2, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p2

    const/16 v3, 0x2000

    new-array v3, v3, [B

    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 17
    :cond_5d
    :goto_5d
    invoke-virtual {p2, v3}, Ljava/io/InputStream;->read([B)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_7f

    const/4 v7, 0x0

    .line 18
    invoke-virtual {p1, v3, v7, v6}, Ljava/io/FileOutputStream;->write([BII)V

    int-to-long v6, v6

    add-long/2addr v1, v6

    .line 19
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v4

    const-wide/16 v8, 0x3e8

    cmp-long v10, v6, v8

    if-lez v10, :cond_5d

    .line 20
    iget-wide v4, p0, Ld/a/b/g/l/e/c;->o:J

    invoke-virtual {p0, v1, v2, v4, v5}, Ld/a/b/g/l/c/f;->a(JJ)V

    .line 21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    goto :goto_5d

    .line 22
    :cond_7f
    iget-object p2, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 23
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V

    .line 24
    iput-object v0, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    .line 25
    invoke-virtual {p0}, Ld/a/b/g/l/e/c;->e()V

    return-void

    .line 26
    :cond_8d
    iget-object p2, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 27
    new-instance p2, Ld/a/b/g/l/e/k;

    iget-object v0, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, p1, v0}, Ld/a/b/g/l/e/k;-><init>(ILjava/lang/String;)V

    throw p2
.end method

.method public final c()Z
    .registers 6

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/e/c;->m:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    iget-wide v2, p0, Ld/a/b/g/l/e/c;->o:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_14

    const-wide/16 v0, 0x0

    cmp-long v4, v2, v0

    if-lez v4, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    :goto_15
    return v0
.end method

.method public final d()V
    .registers 5

    .line 1
    new-instance v0, Ljava/io/File;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Ld/a/b/g/l/e/c;->m:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-wide v2, p0, Ld/a/b/g/l/e/c;->o:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    const-string v2, "%s_%s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Ld/a/b/g/l/e/c;->n:Ljava/io/File;

    return-void
.end method

.method public final e()V
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/e/c;->m:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/e/c;->n:Ljava/io/File;

    iget-object v1, p0, Ld/a/b/g/l/e/c;->m:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 3
    iget-object v0, p0, Ld/a/b/g/l/e/c;->m:Ljava/io/File;

    invoke-virtual {p0, v0}, Ld/a/b/g/l/c/f;->b(Ljava/io/File;)V

    return-void
.end method

.method public final f()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    const-string v1, "Content-Type"

    const-string v2, "text/html; charset=UTF-8"

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 3
    iget-object v0, p0, Ld/a/b/g/l/e/c;->l:Ljava/net/HttpURLConnection;

    const/16 v1, 0x2710

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    return-void
.end method
