.class public Lb/h/f/g;
.super Lb/h/f/e;
.source "TypefaceCompatApi26Impl.java"


# instance fields
.field public final g:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public final h:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation
.end field

.field public final i:Ljava/lang/reflect/Method;

.field public final j:Ljava/lang/reflect/Method;

.field public final k:Ljava/lang/reflect/Method;

.field public final l:Ljava/lang/reflect/Method;

.field public final m:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>()V
    .registers 9

    .line 1
    invoke-direct {p0}, Lb/h/f/e;-><init>()V

    const/4 v0, 0x0

    .line 2
    :try_start_4
    invoke-virtual {p0}, Lb/h/f/g;->d()Ljava/lang/Class;

    move-result-object v1

    .line 3
    invoke-virtual {p0, v1}, Lb/h/f/g;->e(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 4
    invoke-virtual {p0, v1}, Lb/h/f/g;->b(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 5
    invoke-virtual {p0, v1}, Lb/h/f/g;->c(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 6
    invoke-virtual {p0, v1}, Lb/h/f/g;->f(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 7
    invoke-virtual {p0, v1}, Lb/h/f/g;->a(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 8
    invoke-virtual {p0, v1}, Lb/h/f/g;->d(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0
    :try_end_20
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_20} :catch_26
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4 .. :try_end_20} :catch_24

    move-object v7, v1

    move-object v1, v0

    move-object v0, v7

    goto :goto_4b

    :catch_24
    move-exception v1

    goto :goto_27

    :catch_26
    move-exception v1

    .line 9
    :goto_27
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to collect necessary methods for class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "TypefaceCompatApi26Impl"

    invoke-static {v3, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v1, v0

    move-object v2, v1

    move-object v3, v2

    move-object v4, v3

    move-object v5, v4

    move-object v6, v5

    .line 10
    :goto_4b
    iput-object v0, p0, Lb/h/f/g;->g:Ljava/lang/Class;

    .line 11
    iput-object v2, p0, Lb/h/f/g;->h:Ljava/lang/reflect/Constructor;

    .line 12
    iput-object v3, p0, Lb/h/f/g;->i:Ljava/lang/reflect/Method;

    .line 13
    iput-object v4, p0, Lb/h/f/g;->j:Ljava/lang/reflect/Method;

    .line 14
    iput-object v5, p0, Lb/h/f/g;->k:Ljava/lang/reflect/Method;

    .line 15
    iput-object v6, p0, Lb/h/f/g;->l:Ljava/lang/reflect/Method;

    .line 16
    iput-object v1, p0, Lb/h/f/g;->m:Ljava/lang/reflect/Method;

    return-void
.end method

.method private b()Ljava/lang/Object;
    .registers 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lb/h/f/g;->h:Ljava/lang/reflect/Constructor;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_9
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_9} :catch_a
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_9} :catch_a
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_9} :catch_a

    return-object v0

    :catch_a
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public a(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;
    .registers 14

    .line 47
    invoke-virtual {p0}, Lb/h/f/g;->c()Z

    move-result v0

    if-nez v0, :cond_b

    .line 48
    invoke-super/range {p0 .. p5}, Lb/h/f/j;->a(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1

    .line 49
    :cond_b
    invoke-direct {p0}, Lb/h/f/g;->b()Ljava/lang/Object;

    move-result-object p2

    const/4 p3, 0x0

    if-nez p2, :cond_13

    return-object p3

    :cond_13
    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v6, -0x1

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p4

    .line 50
    invoke-virtual/range {v0 .. v7}, Lb/h/f/g;->a(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/String;III[Landroid/graphics/fonts/FontVariationAxis;)Z

    move-result p1

    if-nez p1, :cond_25

    .line 51
    invoke-virtual {p0, p2}, Lb/h/f/g;->b(Ljava/lang/Object;)V

    return-object p3

    .line 52
    :cond_25
    invoke-virtual {p0, p2}, Lb/h/f/g;->c(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2c

    return-object p3

    .line 53
    :cond_2c
    invoke-virtual {p0, p2}, Lb/h/f/g;->a(Ljava/lang/Object;)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/content/Context;Landroid/os/CancellationSignal;[Lb/h/j/f$b;I)Landroid/graphics/Typeface;
    .registers 15

    .line 24
    array-length v0, p3

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ge v0, v1, :cond_6

    return-object v2

    .line 25
    :cond_6
    invoke-virtual {p0}, Lb/h/f/g;->c()Z

    move-result v0

    if-nez v0, :cond_56

    .line 26
    invoke-virtual {p0, p3, p4}, Lb/h/f/j;->a([Lb/h/j/f$b;I)Lb/h/j/f$b;

    move-result-object p3

    .line 27
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    .line 28
    :try_start_14
    invoke-virtual {p3}, Lb/h/j/f$b;->c()Landroid/net/Uri;

    move-result-object p4

    const-string v0, "r"

    invoke-virtual {p1, p4, v0, p2}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    if-nez p1, :cond_26

    if-eqz p1, :cond_25

    .line 29
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_25} :catch_55

    :cond_25
    return-object v2

    .line 30
    :cond_26
    :try_start_26
    new-instance p2, Landroid/graphics/Typeface$Builder;

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p4

    invoke-direct {p2, p4}, Landroid/graphics/Typeface$Builder;-><init>(Ljava/io/FileDescriptor;)V

    .line 31
    invoke-virtual {p3}, Lb/h/j/f$b;->d()I

    move-result p4

    invoke-virtual {p2, p4}, Landroid/graphics/Typeface$Builder;->setWeight(I)Landroid/graphics/Typeface$Builder;

    move-result-object p2

    .line 32
    invoke-virtual {p3}, Lb/h/j/f$b;->e()Z

    move-result p3

    invoke-virtual {p2, p3}, Landroid/graphics/Typeface$Builder;->setItalic(Z)Landroid/graphics/Typeface$Builder;

    move-result-object p2

    .line 33
    invoke-virtual {p2}, Landroid/graphics/Typeface$Builder;->build()Landroid/graphics/Typeface;

    move-result-object p2
    :try_end_43
    .catchall {:try_start_26 .. :try_end_43} :catchall_49

    if-eqz p1, :cond_48

    .line 34
    :try_start_45
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_48
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_48} :catch_55

    :cond_48
    return-object p2

    :catchall_49
    move-exception p2

    if-eqz p1, :cond_54

    .line 35
    :try_start_4c
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_4f
    .catchall {:try_start_4c .. :try_end_4f} :catchall_50

    goto :goto_54

    :catchall_50
    move-exception p1

    :try_start_51
    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_54
    :goto_54
    throw p2
    :try_end_55
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_55} :catch_55

    :catch_55
    return-object v2

    .line 36
    :cond_56
    invoke-static {p1, p3, p2}, Lb/h/f/k;->a(Landroid/content/Context;[Lb/h/j/f$b;Landroid/os/CancellationSignal;)Ljava/util/Map;

    move-result-object p1

    .line 37
    invoke-direct {p0}, Lb/h/f/g;->b()Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_61

    return-object v2

    .line 38
    :cond_61
    array-length v0, p3

    const/4 v3, 0x0

    const/4 v9, 0x0

    :goto_64
    if-ge v9, v0, :cond_91

    aget-object v4, p3, v9

    .line 39
    invoke-virtual {v4}, Lb/h/j/f$b;->c()Landroid/net/Uri;

    move-result-object v5

    invoke-interface {p1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/nio/ByteBuffer;

    if-nez v5, :cond_75

    goto :goto_8e

    .line 40
    :cond_75
    invoke-virtual {v4}, Lb/h/j/f$b;->b()I

    move-result v6

    invoke-virtual {v4}, Lb/h/j/f$b;->d()I

    move-result v7

    invoke-virtual {v4}, Lb/h/j/f$b;->e()Z

    move-result v8

    move-object v3, p0

    move-object v4, p2

    .line 41
    invoke-virtual/range {v3 .. v8}, Lb/h/f/g;->a(Ljava/lang/Object;Ljava/nio/ByteBuffer;III)Z

    move-result v3

    if-nez v3, :cond_8d

    .line 42
    invoke-virtual {p0, p2}, Lb/h/f/g;->b(Ljava/lang/Object;)V

    return-object v2

    :cond_8d
    const/4 v3, 0x1

    :goto_8e
    add-int/lit8 v9, v9, 0x1

    goto :goto_64

    :cond_91
    if-nez v3, :cond_97

    .line 43
    invoke-virtual {p0, p2}, Lb/h/f/g;->b(Ljava/lang/Object;)V

    return-object v2

    .line 44
    :cond_97
    invoke-virtual {p0, p2}, Lb/h/f/g;->c(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_9e

    return-object v2

    .line 45
    :cond_9e
    invoke-virtual {p0, p2}, Lb/h/f/g;->a(Ljava/lang/Object;)Landroid/graphics/Typeface;

    move-result-object p1

    if-nez p1, :cond_a5

    return-object v2

    .line 46
    :cond_a5
    invoke-static {p1, p4}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/content/Context;Lb/h/e/c/c$b;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;
    .registers 15

    .line 13
    invoke-virtual {p0}, Lb/h/f/g;->c()Z

    move-result v0

    if-nez v0, :cond_b

    .line 14
    invoke-super {p0, p1, p2, p3, p4}, Lb/h/f/e;->a(Landroid/content/Context;Lb/h/e/c/c$b;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1

    .line 15
    :cond_b
    invoke-direct {p0}, Lb/h/f/g;->b()Ljava/lang/Object;

    move-result-object p3

    const/4 p4, 0x0

    if-nez p3, :cond_13

    return-object p4

    .line 16
    :cond_13
    invoke-virtual {p2}, Lb/h/e/c/c$b;->a()[Lb/h/e/c/c$c;

    move-result-object p2

    array-length v8, p2

    const/4 v0, 0x0

    const/4 v9, 0x0

    :goto_1a
    if-ge v9, v8, :cond_46

    aget-object v0, p2, v9

    .line 17
    invoke-virtual {v0}, Lb/h/e/c/c$c;->a()Ljava/lang/String;

    move-result-object v3

    .line 18
    invoke-virtual {v0}, Lb/h/e/c/c$c;->c()I

    move-result v4

    invoke-virtual {v0}, Lb/h/e/c/c$c;->e()I

    move-result v5

    invoke-virtual {v0}, Lb/h/e/c/c$c;->f()Z

    move-result v6

    .line 19
    invoke-virtual {v0}, Lb/h/e/c/c$c;->d()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/fonts/FontVariationAxis;->fromFontVariationSettings(Ljava/lang/String;)[Landroid/graphics/fonts/FontVariationAxis;

    move-result-object v7

    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    .line 20
    invoke-virtual/range {v0 .. v7}, Lb/h/f/g;->a(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/String;III[Landroid/graphics/fonts/FontVariationAxis;)Z

    move-result v0

    if-nez v0, :cond_43

    .line 21
    invoke-virtual {p0, p3}, Lb/h/f/g;->b(Ljava/lang/Object;)V

    return-object p4

    :cond_43
    add-int/lit8 v9, v9, 0x1

    goto :goto_1a

    .line 22
    :cond_46
    invoke-virtual {p0, p3}, Lb/h/f/g;->c(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4d

    return-object p4

    .line 23
    :cond_4d
    invoke-virtual {p0, p3}, Lb/h/f/g;->a(Ljava/lang/Object;)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/lang/Object;)Landroid/graphics/Typeface;
    .registers 7

    const/4 v0, 0x0

    .line 8
    :try_start_1
    iget-object v1, p0, Lb/h/f/g;->g:Ljava/lang/Class;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    const/4 v3, 0x0

    .line 9
    invoke-static {v1, v3, p1}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 10
    iget-object p1, p0, Lb/h/f/g;->m:Ljava/lang/reflect/Method;

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v1, v4, v3

    const/4 v1, -0x1

    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v4, v2

    const/4 v2, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v2

    .line 12
    invoke-virtual {p1, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Typeface;
    :try_end_27
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_27} :catch_28
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_27} :catch_28

    return-object p1

    :catch_28
    return-object v0
.end method

.method public a(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Class;

    const-string v1, "abortCreation"

    .line 54
    invoke-virtual {p1, v1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    return-object p1
.end method

.method public final a(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/String;III[Landroid/graphics/fonts/FontVariationAxis;)Z
    .registers 11

    const/4 v0, 0x0

    .line 1
    :try_start_1
    iget-object v1, p0, Lb/h/f/g;->i:Ljava/lang/reflect/Method;

    const/16 v2, 0x8

    new-array v2, v2, [Ljava/lang/Object;

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    aput-object p1, v2, v0

    const/4 p1, 0x1

    aput-object p3, v2, p1

    const/4 p1, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v2, p1

    const/4 p1, 0x3

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    aput-object p3, v2, p1

    const/4 p1, 0x4

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v2, p1

    const/4 p1, 0x5

    .line 3
    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v2, p1

    const/4 p1, 0x6

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v2, p1

    const/4 p1, 0x7

    aput-object p7, v2, p1

    .line 4
    invoke-virtual {v1, p2, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1
    :try_end_40
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_40} :catch_41
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_40} :catch_41

    return p1

    :catch_41
    return v0
.end method

.method public final a(Ljava/lang/Object;Ljava/nio/ByteBuffer;III)Z
    .registers 9

    const/4 v0, 0x0

    .line 5
    :try_start_1
    iget-object v1, p0, Lb/h/f/g;->j:Ljava/lang/reflect/Method;

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p2, v2, v0

    const/4 p2, 0x1

    .line 6
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v2, p2

    const/4 p2, 0x2

    const/4 p3, 0x0

    aput-object p3, v2, p2

    const/4 p2, 0x3

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v2, p2

    const/4 p2, 0x4

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v2, p2

    .line 7
    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1
    :try_end_2b
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_2b} :catch_2c
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_2b} :catch_2c

    return p1

    :catch_2c
    return v0
.end method

.method public b(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    .line 3
    const-class v2, Landroid/content/res/AssetManager;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Ljava/lang/String;

    aput-object v2, v0, v1

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    const/4 v2, 0x5

    aput-object v1, v0, v2

    const/4 v2, 0x6

    aput-object v1, v0, v2

    const/4 v1, 0x7

    const-class v2, [Landroid/graphics/fonts/FontVariationAxis;

    aput-object v2, v0, v1

    const-string v1, "addFontFromAssetManager"

    invoke-virtual {p1, v1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    return-object p1
.end method

.method public final b(Ljava/lang/Object;)V
    .registers 4

    .line 2
    :try_start_0
    iget-object v0, p0, Lb/h/f/g;->l:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_8} :catch_8
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_8} :catch_8

    :catch_8
    return-void
.end method

.method public c(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    .line 5
    const-class v2, Ljava/nio/ByteBuffer;

    aput-object v2, v0, v1

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const/4 v2, 0x2

    const-class v3, [Landroid/graphics/fonts/FontVariationAxis;

    aput-object v3, v0, v2

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const/4 v2, 0x4

    aput-object v1, v0, v2

    const-string v1, "addFontFromBuffer"

    invoke-virtual {p1, v1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    return-object p1
.end method

.method public final c()Z
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/f/g;->i:Ljava/lang/reflect/Method;

    if-nez v0, :cond_b

    const-string v0, "TypefaceCompatApi26Impl"

    const-string v1, "Unable to collect necessary private methods. Fallback to legacy implementation."

    .line 2
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_b
    iget-object v0, p0, Lb/h/f/g;->i:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_11

    const/4 v0, 0x1

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    return v0
.end method

.method public final c(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x0

    .line 4
    :try_start_1
    iget-object v1, p0, Lb/h/f/g;->k:Ljava/lang/reflect/Method;

    new-array v2, v0, [Ljava/lang/Object;

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1
    :try_end_f
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_f} :catch_10
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_f} :catch_10

    return p1

    :catch_10
    return v0
.end method

.method public d()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    const-string v0, "android.graphics.FontFamily"

    .line 1
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public d(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 2
    invoke-static {p1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object p1

    .line 3
    const-class v1, Landroid/graphics/Typeface;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Class;

    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const/4 v3, 0x0

    aput-object p1, v2, v3

    sget-object p1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object p1, v2, v0

    const/4 v3, 0x2

    aput-object p1, v2, v3

    const-string p1, "createFromFamiliesWithDefault"

    .line 5
    invoke-virtual {v1, p1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 6
    invoke-virtual {p1, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    return-object p1
.end method

.method public e(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Class;

    .line 1
    invoke-virtual {p1, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p1

    return-object p1
.end method

.method public f(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Class;

    const-string v1, "freeze"

    .line 1
    invoke-virtual {p1, v1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    return-object p1
.end method
