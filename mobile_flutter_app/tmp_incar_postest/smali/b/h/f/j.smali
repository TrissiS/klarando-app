.class public Lb/h/f/j;
.super Ljava/lang/Object;
.source "TypefaceCompatBaseImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/h/f/j$c;
    }
.end annotation


# instance fields
.field public a:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "BanConcurrentHashMap"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/Long;",
            "Lb/h/e/c/c$b;",
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
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lb/h/f/j;->a:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method public static a([Ljava/lang/Object;ILb/h/f/j$c;)Ljava/lang/Object;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;I",
            "Lb/h/f/j$c<",
            "TT;>;)TT;"
        }
    .end annotation

    and-int/lit8 v0, p1, 0x1

    if-nez v0, :cond_7

    const/16 v0, 0x190

    goto :goto_9

    :cond_7
    const/16 v0, 0x2bc

    :goto_9
    and-int/lit8 p1, p1, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p1, :cond_11

    const/4 p1, 0x1

    goto :goto_12

    :cond_11
    const/4 p1, 0x0

    :goto_12
    const/4 v3, 0x0

    const v4, 0x7fffffff

    .line 1
    array-length v5, p0

    const/4 v6, 0x0

    :goto_18
    if-ge v6, v5, :cond_3a

    aget-object v7, p0, v6

    .line 2
    invoke-interface {p2, v7}, Lb/h/f/j$c;->a(Ljava/lang/Object;)I

    move-result v8

    sub-int/2addr v8, v0

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    mul-int/lit8 v8, v8, 0x2

    .line 3
    invoke-interface {p2, v7}, Lb/h/f/j$c;->b(Ljava/lang/Object;)Z

    move-result v9

    if-ne v9, p1, :cond_2f

    const/4 v9, 0x0

    goto :goto_30

    :cond_2f
    const/4 v9, 0x1

    :goto_30
    add-int/2addr v8, v9

    if-eqz v3, :cond_35

    if-le v4, v8, :cond_37

    :cond_35
    move-object v3, v7

    move v4, v8

    :cond_37
    add-int/lit8 v6, v6, 0x1

    goto :goto_18

    :cond_3a
    return-object v3
.end method

.method public static b(Landroid/graphics/Typeface;)J
    .registers 7

    const-string v0, "Could not retrieve font from family."

    const-string v1, "TypefaceCompatBaseImpl"

    const-wide/16 v2, 0x0

    if-nez p0, :cond_9

    return-wide v2

    .line 1
    :cond_9
    :try_start_9
    const-class v4, Landroid/graphics/Typeface;

    const-string v5, "native_instance"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    const/4 v5, 0x1

    .line 2
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 3
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    .line 4
    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldException; {:try_start_9 .. :try_end_1f} :catch_25
    .catch Ljava/lang/IllegalAccessException; {:try_start_9 .. :try_end_1f} :catch_20

    return-wide v0

    :catch_20
    move-exception p0

    .line 5
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-wide v2

    :catch_25
    move-exception p0

    .line 6
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-wide v2
.end method


# virtual methods
.method public a(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;
    .registers 6

    .line 24
    invoke-static {p1}, Lb/h/f/k;->a(Landroid/content/Context;)Ljava/io/File;

    move-result-object p1

    const/4 p4, 0x0

    if-nez p1, :cond_8

    return-object p4

    .line 25
    :cond_8
    :try_start_8
    invoke-static {p1, p2, p3}, Lb/h/f/k;->a(Ljava/io/File;Landroid/content/res/Resources;I)Z

    move-result p2
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_c} :catch_23
    .catchall {:try_start_8 .. :try_end_c} :catchall_1e

    if-nez p2, :cond_12

    .line 26
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-object p4

    .line 27
    :cond_12
    :try_start_12
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p2
    :try_end_1a
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_1a} :catch_23
    .catchall {:try_start_12 .. :try_end_1a} :catchall_1e

    .line 28
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-object p2

    :catchall_1e
    move-exception p2

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 29
    throw p2

    .line 30
    :catch_23
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-object p4
.end method

.method public a(Landroid/content/Context;Landroid/os/CancellationSignal;[Lb/h/j/f$b;I)Landroid/graphics/Typeface;
    .registers 7

    .line 12
    array-length p2, p3

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ge p2, v1, :cond_6

    return-object v0

    .line 13
    :cond_6
    invoke-virtual {p0, p3, p4}, Lb/h/f/j;->a([Lb/h/j/f$b;I)Lb/h/j/f$b;

    move-result-object p2

    .line 14
    :try_start_a
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p3

    invoke-virtual {p2}, Lb/h/j/f$b;->c()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p3, p2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p2
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_16} :catch_26
    .catchall {:try_start_a .. :try_end_16} :catchall_21

    .line 15
    :try_start_16
    invoke-virtual {p0, p1, p2}, Lb/h/f/j;->a(Landroid/content/Context;Ljava/io/InputStream;)Landroid/graphics/Typeface;

    move-result-object p1
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_1a} :catch_27
    .catchall {:try_start_16 .. :try_end_1a} :catchall_1e

    .line 16
    invoke-static {p2}, Lb/h/f/k;->a(Ljava/io/Closeable;)V

    return-object p1

    :catchall_1e
    move-exception p1

    move-object v0, p2

    goto :goto_22

    :catchall_21
    move-exception p1

    :goto_22
    invoke-static {v0}, Lb/h/f/k;->a(Ljava/io/Closeable;)V

    .line 17
    throw p1

    :catch_26
    move-object p2, v0

    .line 18
    :catch_27
    invoke-static {p2}, Lb/h/f/k;->a(Ljava/io/Closeable;)V

    return-object v0
.end method

.method public a(Landroid/content/Context;Lb/h/e/c/c$b;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;
    .registers 7

    .line 20
    invoke-virtual {p0, p2, p4}, Lb/h/f/j;->a(Lb/h/e/c/c$b;I)Lb/h/e/c/c$c;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 p1, 0x0

    return-object p1

    .line 21
    :cond_8
    invoke-virtual {v0}, Lb/h/e/c/c$c;->b()I

    move-result v1

    invoke-virtual {v0}, Lb/h/e/c/c$c;->a()Ljava/lang/String;

    move-result-object v0

    .line 22
    invoke-static {p1, p3, v1, v0, p4}, Lb/h/f/d;->a(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p1

    .line 23
    invoke-virtual {p0, p1, p2}, Lb/h/f/j;->a(Landroid/graphics/Typeface;Lb/h/e/c/c$b;)V

    return-object p1
.end method

.method public a(Landroid/content/Context;Ljava/io/InputStream;)Landroid/graphics/Typeface;
    .registers 4

    .line 5
    invoke-static {p1}, Lb/h/f/k;->a(Landroid/content/Context;)Ljava/io/File;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_8

    return-object v0

    .line 6
    :cond_8
    :try_start_8
    invoke-static {p1, p2}, Lb/h/f/k;->a(Ljava/io/File;Ljava/io/InputStream;)Z

    move-result p2
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_c} :catch_23
    .catchall {:try_start_8 .. :try_end_c} :catchall_1e

    if-nez p2, :cond_12

    .line 7
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-object v0

    .line 8
    :cond_12
    :try_start_12
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p2
    :try_end_1a
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_1a} :catch_23
    .catchall {:try_start_12 .. :try_end_1a} :catchall_1e

    .line 9
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-object p2

    :catchall_1e
    move-exception p2

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 10
    throw p2

    .line 11
    :catch_23
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-object v0
.end method

.method public a(Landroid/graphics/Typeface;)Lb/h/e/c/c$b;
    .registers 6

    .line 31
    invoke-static {p1}, Lb/h/f/j;->b(Landroid/graphics/Typeface;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-nez p1, :cond_c

    const/4 p1, 0x0

    return-object p1

    .line 32
    :cond_c
    iget-object p1, p0, Lb/h/f/j;->a:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/h/e/c/c$b;

    return-object p1
.end method

.method public final a(Lb/h/e/c/c$b;I)Lb/h/e/c/c$c;
    .registers 4

    .line 19
    invoke-virtual {p1}, Lb/h/e/c/c$b;->a()[Lb/h/e/c/c$c;

    move-result-object p1

    new-instance v0, Lb/h/f/j$b;

    invoke-direct {v0, p0}, Lb/h/f/j$b;-><init>(Lb/h/f/j;)V

    invoke-static {p1, p2, v0}, Lb/h/f/j;->a([Ljava/lang/Object;ILb/h/f/j$c;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/h/e/c/c$c;

    return-object p1
.end method

.method public a([Lb/h/j/f$b;I)Lb/h/j/f$b;
    .registers 4

    .line 4
    new-instance v0, Lb/h/f/j$a;

    invoke-direct {v0, p0}, Lb/h/f/j$a;-><init>(Lb/h/f/j;)V

    invoke-static {p1, p2, v0}, Lb/h/f/j;->a([Ljava/lang/Object;ILb/h/f/j$c;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/h/j/f$b;

    return-object p1
.end method

.method public final a(Landroid/graphics/Typeface;Lb/h/e/c/c$b;)V
    .registers 7

    .line 33
    invoke-static {p1}, Lb/h/f/j;->b(Landroid/graphics/Typeface;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_13

    .line 34
    iget-object p1, p0, Lb/h/f/j;->a:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_13
    return-void
.end method
