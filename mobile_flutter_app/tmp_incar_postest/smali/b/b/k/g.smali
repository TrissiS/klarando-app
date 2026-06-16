.class public Lb/b/k/g;
.super Ljava/lang/Object;
.source "ResourcesFlusher.java"


# static fields
.field public static a:Ljava/lang/reflect/Field;

.field public static b:Z

.field public static c:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static d:Z

.field public static e:Ljava/lang/reflect/Field;

.field public static f:Z

.field public static g:Ljava/lang/reflect/Field;

.field public static h:Z


# direct methods
.method public static a(Landroid/content/res/Resources;)V
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_7

    return-void

    :cond_7
    const/16 v1, 0x18

    if-lt v0, v1, :cond_f

    .line 2
    invoke-static {p0}, Lb/b/k/g;->d(Landroid/content/res/Resources;)V

    goto :goto_1e

    :cond_f
    const/16 v1, 0x17

    if-lt v0, v1, :cond_17

    .line 3
    invoke-static {p0}, Lb/b/k/g;->c(Landroid/content/res/Resources;)V

    goto :goto_1e

    :cond_17
    const/16 v1, 0x15

    if-lt v0, v1, :cond_1e

    .line 4
    invoke-static {p0}, Lb/b/k/g;->b(Landroid/content/res/Resources;)V

    :cond_1e
    :goto_1e
    return-void
.end method

.method public static a(Ljava/lang/Object;)V
    .registers 5

    .line 5
    sget-boolean v0, Lb/b/k/g;->d:Z

    const/4 v1, 0x1

    const-string v2, "ResourcesFlusher"

    if-nez v0, :cond_18

    :try_start_7
    const-string v0, "android.content.res.ThemedResourceCache"

    .line 6
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lb/b/k/g;->c:Ljava/lang/Class;
    :try_end_f
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7 .. :try_end_f} :catch_10

    goto :goto_16

    :catch_10
    move-exception v0

    const-string v3, "Could not find ThemedResourceCache class"

    .line 7
    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 8
    :goto_16
    sput-boolean v1, Lb/b/k/g;->d:Z

    .line 9
    :cond_18
    sget-object v0, Lb/b/k/g;->c:Ljava/lang/Class;

    if-nez v0, :cond_1d

    return-void

    .line 10
    :cond_1d
    sget-boolean v3, Lb/b/k/g;->f:Z

    if-nez v3, :cond_35

    :try_start_21
    const-string v3, "mUnthemedEntries"

    .line 11
    invoke-virtual {v0, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lb/b/k/g;->e:Ljava/lang/reflect/Field;

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_2c
    .catch Ljava/lang/NoSuchFieldException; {:try_start_21 .. :try_end_2c} :catch_2d

    goto :goto_33

    :catch_2d
    move-exception v0

    const-string v3, "Could not retrieve ThemedResourceCache#mUnthemedEntries field"

    .line 13
    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 14
    :goto_33
    sput-boolean v1, Lb/b/k/g;->f:Z

    .line 15
    :cond_35
    sget-object v0, Lb/b/k/g;->e:Ljava/lang/reflect/Field;

    if-nez v0, :cond_3a

    return-void

    :cond_3a
    const/4 v1, 0x0

    .line 16
    :try_start_3b
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/LongSparseArray;
    :try_end_41
    .catch Ljava/lang/IllegalAccessException; {:try_start_3b .. :try_end_41} :catch_43

    move-object v1, p0

    goto :goto_49

    :catch_43
    move-exception p0

    const-string v0, "Could not retrieve value from ThemedResourceCache#mUnthemedEntries"

    .line 17
    invoke-static {v2, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_49
    if-eqz v1, :cond_4e

    .line 18
    invoke-virtual {v1}, Landroid/util/LongSparseArray;->clear()V

    :cond_4e
    return-void
.end method

.method public static b(Landroid/content/res/Resources;)V
    .registers 5

    .line 1
    sget-boolean v0, Lb/b/k/g;->b:Z

    const-string v1, "ResourcesFlusher"

    if-nez v0, :cond_1d

    const/4 v0, 0x1

    .line 2
    :try_start_7
    const-class v2, Landroid/content/res/Resources;

    const-string v3, "mDrawableCache"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    sput-object v2, Lb/b/k/g;->a:Ljava/lang/reflect/Field;

    .line 3
    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_14
    .catch Ljava/lang/NoSuchFieldException; {:try_start_7 .. :try_end_14} :catch_15

    goto :goto_1b

    :catch_15
    move-exception v2

    const-string v3, "Could not retrieve Resources#mDrawableCache field"

    .line 4
    invoke-static {v1, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 5
    :goto_1b
    sput-boolean v0, Lb/b/k/g;->b:Z

    .line 6
    :cond_1d
    sget-object v0, Lb/b/k/g;->a:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_35

    const/4 v2, 0x0

    .line 7
    :try_start_22
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;
    :try_end_28
    .catch Ljava/lang/IllegalAccessException; {:try_start_22 .. :try_end_28} :catch_2a

    move-object v2, p0

    goto :goto_30

    :catch_2a
    move-exception p0

    const-string v0, "Could not retrieve value from Resources#mDrawableCache"

    .line 8
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_30
    if-eqz v2, :cond_35

    .line 9
    invoke-interface {v2}, Ljava/util/Map;->clear()V

    :cond_35
    return-void
.end method

.method public static c(Landroid/content/res/Resources;)V
    .registers 5

    .line 1
    sget-boolean v0, Lb/b/k/g;->b:Z

    const-string v1, "ResourcesFlusher"

    if-nez v0, :cond_1d

    const/4 v0, 0x1

    .line 2
    :try_start_7
    const-class v2, Landroid/content/res/Resources;

    const-string v3, "mDrawableCache"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    sput-object v2, Lb/b/k/g;->a:Ljava/lang/reflect/Field;

    .line 3
    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_14
    .catch Ljava/lang/NoSuchFieldException; {:try_start_7 .. :try_end_14} :catch_15

    goto :goto_1b

    :catch_15
    move-exception v2

    const-string v3, "Could not retrieve Resources#mDrawableCache field"

    .line 4
    invoke-static {v1, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 5
    :goto_1b
    sput-boolean v0, Lb/b/k/g;->b:Z

    :cond_1d
    const/4 v0, 0x0

    .line 6
    sget-object v2, Lb/b/k/g;->a:Ljava/lang/reflect/Field;

    if-eqz v2, :cond_2d

    .line 7
    :try_start_22
    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_26
    .catch Ljava/lang/IllegalAccessException; {:try_start_22 .. :try_end_26} :catch_27

    goto :goto_2d

    :catch_27
    move-exception p0

    const-string v2, "Could not retrieve value from Resources#mDrawableCache"

    .line 8
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2d
    :goto_2d
    if-nez v0, :cond_30

    return-void

    .line 9
    :cond_30
    invoke-static {v0}, Lb/b/k/g;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public static d(Landroid/content/res/Resources;)V
    .registers 6

    .line 1
    sget-boolean v0, Lb/b/k/g;->h:Z

    const/4 v1, 0x1

    const-string v2, "ResourcesFlusher"

    if-nez v0, :cond_1d

    .line 2
    :try_start_7
    const-class v0, Landroid/content/res/Resources;

    const-string v3, "mResourcesImpl"

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lb/b/k/g;->g:Ljava/lang/reflect/Field;

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_14
    .catch Ljava/lang/NoSuchFieldException; {:try_start_7 .. :try_end_14} :catch_15

    goto :goto_1b

    :catch_15
    move-exception v0

    const-string v3, "Could not retrieve Resources#mResourcesImpl field"

    .line 4
    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 5
    :goto_1b
    sput-boolean v1, Lb/b/k/g;->h:Z

    .line 6
    :cond_1d
    sget-object v0, Lb/b/k/g;->g:Ljava/lang/reflect/Field;

    if-nez v0, :cond_22

    return-void

    :cond_22
    const/4 v3, 0x0

    .line 7
    :try_start_23
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_27
    .catch Ljava/lang/IllegalAccessException; {:try_start_23 .. :try_end_27} :catch_28

    goto :goto_2f

    :catch_28
    move-exception p0

    const-string v0, "Could not retrieve value from Resources#mResourcesImpl"

    .line 8
    invoke-static {v2, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object p0, v3

    :goto_2f
    if-nez p0, :cond_32

    return-void

    .line 9
    :cond_32
    sget-boolean v0, Lb/b/k/g;->b:Z

    if-nez v0, :cond_4e

    .line 10
    :try_start_36
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v4, "mDrawableCache"

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lb/b/k/g;->a:Ljava/lang/reflect/Field;

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_45
    .catch Ljava/lang/NoSuchFieldException; {:try_start_36 .. :try_end_45} :catch_46

    goto :goto_4c

    :catch_46
    move-exception v0

    const-string v4, "Could not retrieve ResourcesImpl#mDrawableCache field"

    .line 12
    invoke-static {v2, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 13
    :goto_4c
    sput-boolean v1, Lb/b/k/g;->b:Z

    .line 14
    :cond_4e
    sget-object v0, Lb/b/k/g;->a:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_5d

    .line 15
    :try_start_52
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_56
    .catch Ljava/lang/IllegalAccessException; {:try_start_52 .. :try_end_56} :catch_57

    goto :goto_5d

    :catch_57
    move-exception p0

    const-string v0, "Could not retrieve value from ResourcesImpl#mDrawableCache"

    .line 16
    invoke-static {v2, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5d
    :goto_5d
    if-eqz v3, :cond_62

    .line 17
    invoke-static {v3}, Lb/b/k/g;->a(Ljava/lang/Object;)V

    :cond_62
    return-void
.end method
