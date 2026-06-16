.class public Ld/a/b/g/l/e/d;
.super Ld/a/b/g/l/c/g;
.source "DefaultFileChecker.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ld/a/b/g/l/c/g;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/io/File;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_1
    const-string v1, "MD5"

    .line 1
    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 2
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_c} :catch_30
    .catchall {:try_start_1 .. :try_end_c} :catchall_2e

    const/16 p1, 0x2000

    :try_start_e
    new-array p1, p1, [B

    .line 3
    :goto_10
    invoke-virtual {v2, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    const/4 v3, -0x1

    if-eq v0, v3, :cond_1c

    const/4 v3, 0x0

    .line 4
    invoke-virtual {v1, p1, v3, v0}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_10

    .line 5
    :cond_1c
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p1

    .line 6
    invoke-virtual {p0, p1}, Ld/a/b/g/l/e/d;->a([B)Ljava/lang/String;

    move-result-object p1
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_24} :catch_2b
    .catchall {:try_start_e .. :try_end_24} :catchall_28

    .line 7
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    goto :goto_3b

    :catchall_28
    move-exception p1

    move-object v0, v2

    goto :goto_3c

    :catch_2b
    move-exception p1

    move-object v0, v2

    goto :goto_31

    :catchall_2e
    move-exception p1

    goto :goto_3c

    :catch_30
    move-exception p1

    .line 8
    :goto_31
    :try_start_31
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_34
    .catchall {:try_start_31 .. :try_end_34} :catchall_2e

    if-eqz v0, :cond_39

    .line 9
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    :cond_39
    const-string p1, ""

    :goto_3b
    return-object p1

    :goto_3c
    if-eqz v0, :cond_41

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 10
    :cond_41
    throw p1
.end method

.method public final a([B)Ljava/lang/String;
    .registers 6

    .line 11
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v1, 0x0

    .line 12
    :goto_6
    array-length v2, p1

    if-ge v1, v2, :cond_22

    .line 13
    aget-byte v2, p1, v1

    if-gez v2, :cond_f

    add-int/lit16 v2, v2, 0x100

    :cond_f
    const/16 v3, 0x10

    if-ge v2, v3, :cond_18

    const-string v3, "0"

    .line 14
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 15
    :cond_18
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 16
    :cond_22
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public b()Z
    .registers 2

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ld/a/b/g/l/e/d;->d()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_5

    const/4 v0, 0x1

    return v0

    :catch_5
    const/4 v0, 0x0

    return v0
.end method

.method public c()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ld/a/b/g/l/e/d;->d()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_4

    return-void

    :catch_4
    move-exception v0

    .line 2
    iget-object v1, p0, Ld/a/b/g/l/c/g;->b:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 3
    throw v0
.end method

.method public final d()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/c/g;->a:Ld/a/b/g/l/f/b;

    invoke-virtual {v0}, Ld/a/b/g/l/f/b;->a()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 2
    invoke-virtual {p0}, Ld/a/b/g/l/e/d;->e()V

    goto :goto_13

    .line 3
    :cond_10
    invoke-virtual {p0}, Ld/a/b/g/l/e/d;->f()V

    :goto_13
    return-void
.end method

.method public final e()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/c/g;->b:Ljava/io/File;

    invoke-virtual {p0, v0}, Ld/a/b/g/l/e/d;->a(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 2
    iget-object v1, p0, Ld/a/b/g/l/c/g;->a:Ld/a/b/g/l/f/b;

    invoke-virtual {v1}, Ld/a/b/g/l/f/b;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    return-void

    .line 3
    :cond_13
    new-instance v1, Ljava/lang/RuntimeException;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    iget-object v3, p0, Ld/a/b/g/l/c/g;->a:Ld/a/b/g/l/f/b;

    .line 4
    invoke-virtual {v3}, Ld/a/b/g/l/f/b;->a()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    const-string v0, "The md5 not matched between apk and update entity. apk is %s but update is %s"

    .line 5
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final f()V
    .registers 6

    .line 1
    invoke-static {}, Ld/a/b/g/l/g/a;->d()Ld/a/b/g/l/g/a;

    move-result-object v0

    invoke-virtual {v0}, Ld/a/b/g/l/g/a;->b()Landroid/content/Context;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 3
    iget-object v1, p0, Ld/a/b/g/l/c/g;->b:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageArchiveInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 4
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    if-eqz v1, :cond_40

    iget-object v3, p0, Ld/a/b/g/l/c/g;->a:Ld/a/b/g/l/f/b;

    invoke-virtual {v3}, Ld/a/b/g/l/f/b;->b()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_40

    iget v1, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    iget-object v3, p0, Ld/a/b/g/l/c/g;->a:Ld/a/b/g/l/f/b;

    invoke-virtual {v3}, Ld/a/b/g/l/f/b;->e()I

    move-result v3

    if-ne v1, v3, :cond_40

    .line 5
    iget-object v1, p0, Ld/a/b/g/l/c/g;->a:Ld/a/b/g/l/f/b;

    iget v2, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v1, v2}, Ld/a/b/g/l/f/b;->a(I)V

    .line 6
    iget-object v1, p0, Ld/a/b/g/l/c/g;->a:Ld/a/b/g/l/f/b;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ld/a/b/g/l/f/b;->d(Ljava/lang/String;)V

    return-void

    .line 7
    :cond_40
    new-instance v1, Ljava/lang/IllegalStateException;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 8
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v4

    iget-object v0, p0, Ld/a/b/g/l/c/g;->a:Ld/a/b/g/l/f/b;

    invoke-virtual {v0}, Ld/a/b/g/l/f/b;->e()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v2

    const-string v0, "The version code not matched between apk and update entity. apk is %s but update is %s"

    .line 9
    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
