.class public Lb/h/f/d;
.super Ljava/lang/Object;
.source "TypefaceCompat.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/h/f/d$a;
    }
.end annotation


# static fields
.field public static final a:Lb/h/f/j;

.field public static final b:Lb/e/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/e<",
            "Ljava/lang/String;",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_e

    .line 2
    new-instance v0, Lb/h/f/i;

    invoke-direct {v0}, Lb/h/f/i;-><init>()V

    sput-object v0, Lb/h/f/d;->a:Lb/h/f/j;

    goto :goto_4d

    :cond_e
    const/16 v1, 0x1c

    if-lt v0, v1, :cond_1a

    .line 3
    new-instance v0, Lb/h/f/h;

    invoke-direct {v0}, Lb/h/f/h;-><init>()V

    sput-object v0, Lb/h/f/d;->a:Lb/h/f/j;

    goto :goto_4d

    :cond_1a
    const/16 v1, 0x1a

    if-lt v0, v1, :cond_26

    .line 4
    new-instance v0, Lb/h/f/g;

    invoke-direct {v0}, Lb/h/f/g;-><init>()V

    sput-object v0, Lb/h/f/d;->a:Lb/h/f/j;

    goto :goto_4d

    :cond_26
    const/16 v1, 0x18

    if-lt v0, v1, :cond_38

    .line 5
    invoke-static {}, Lb/h/f/f;->a()Z

    move-result v0

    if-eqz v0, :cond_38

    .line 6
    new-instance v0, Lb/h/f/f;

    invoke-direct {v0}, Lb/h/f/f;-><init>()V

    sput-object v0, Lb/h/f/d;->a:Lb/h/f/j;

    goto :goto_4d

    .line 7
    :cond_38
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_46

    .line 8
    new-instance v0, Lb/h/f/e;

    invoke-direct {v0}, Lb/h/f/e;-><init>()V

    sput-object v0, Lb/h/f/d;->a:Lb/h/f/j;

    goto :goto_4d

    .line 9
    :cond_46
    new-instance v0, Lb/h/f/j;

    invoke-direct {v0}, Lb/h/f/j;-><init>()V

    sput-object v0, Lb/h/f/d;->a:Lb/h/f/j;

    .line 10
    :goto_4d
    new-instance v0, Lb/e/e;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Lb/e/e;-><init>(I)V

    sput-object v0, Lb/h/f/d;->b:Lb/e/e;

    return-void
.end method

.method public static a(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;
    .registers 11

    .line 20
    sget-object v0, Lb/h/f/d;->a:Lb/h/f/j;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lb/h/f/j;->a(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    if-eqz p0, :cond_16

    .line 21
    invoke-static {p1, p2, p4}, Lb/h/f/d;->a(Landroid/content/res/Resources;II)Ljava/lang/String;

    move-result-object p1

    .line 22
    sget-object p2, Lb/h/f/d;->b:Lb/e/e;

    invoke-virtual {p2, p1, p0}, Lb/e/e;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_16
    return-object p0
.end method

.method public static a(Landroid/content/Context;Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    .registers 5

    if-eqz p0, :cond_14

    .line 24
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_f

    .line 25
    invoke-static {p0, p1, p2}, Lb/h/f/d;->b(Landroid/content/Context;Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p0

    if-eqz p0, :cond_f

    return-object p0

    .line 26
    :cond_f
    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0

    .line 27
    :cond_14
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Context cannot be null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static a(Landroid/content/Context;Landroid/os/CancellationSignal;[Lb/h/j/f$b;I)Landroid/graphics/Typeface;
    .registers 5

    .line 23
    sget-object v0, Lb/h/f/d;->a:Lb/h/f/j;

    invoke-virtual {v0, p0, p1, p2, p3}, Lb/h/f/j;->a(Landroid/content/Context;Landroid/os/CancellationSignal;[Lb/h/j/f$b;I)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;Lb/h/e/c/c$a;Landroid/content/res/Resources;IILb/h/e/c/f$a;Landroid/os/Handler;Z)Landroid/graphics/Typeface;
    .registers 21

    move-object v0, p1

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    .line 6
    instance-of v3, v0, Lb/h/e/c/c$d;

    if-eqz v3, :cond_4d

    .line 7
    check-cast v0, Lb/h/e/c/c$d;

    .line 8
    invoke-virtual {v0}, Lb/h/e/c/c$d;->c()Ljava/lang/String;

    move-result-object v3

    .line 9
    invoke-static {v3}, Lb/h/f/d;->a(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v3

    if-eqz v3, :cond_1b

    if-eqz v1, :cond_1a

    .line 10
    invoke-virtual {v1, v3, v2}, Lb/h/e/c/f$a;->a(Landroid/graphics/Typeface;Landroid/os/Handler;)V

    :cond_1a
    return-object v3

    :cond_1b
    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz p7, :cond_26

    .line 11
    invoke-virtual {v0}, Lb/h/e/c/c$d;->a()I

    move-result v5

    if-nez v5, :cond_2a

    goto :goto_28

    :cond_26
    if-nez v1, :cond_2a

    :goto_28
    const/4 v9, 0x1

    goto :goto_2b

    :cond_2a
    const/4 v9, 0x0

    :goto_2b
    if-eqz p7, :cond_33

    .line 12
    invoke-virtual {v0}, Lb/h/e/c/c$d;->d()I

    move-result v3

    move v10, v3

    goto :goto_35

    :cond_33
    const/4 v3, -0x1

    const/4 v10, -0x1

    .line 13
    :goto_35
    invoke-static/range {p6 .. p6}, Lb/h/e/c/f$a;->a(Landroid/os/Handler;)Landroid/os/Handler;

    move-result-object v11

    .line 14
    new-instance v12, Lb/h/f/d$a;

    invoke-direct {v12, v1}, Lb/h/f/d$a;-><init>(Lb/h/e/c/f$a;)V

    .line 15
    invoke-virtual {v0}, Lb/h/e/c/c$d;->b()Lb/h/j/d;

    move-result-object v7

    move-object v6, p0

    move/from16 v8, p4

    invoke-static/range {v6 .. v12}, Lb/h/j/f;->a(Landroid/content/Context;Lb/h/j/d;IZILandroid/os/Handler;Lb/h/j/f$c;)Landroid/graphics/Typeface;

    move-result-object v0

    move-object v5, p2

    move/from16 v6, p4

    goto :goto_65

    .line 16
    :cond_4d
    sget-object v3, Lb/h/f/d;->a:Lb/h/f/j;

    check-cast v0, Lb/h/e/c/c$b;

    move-object v4, p0

    move-object v5, p2

    move/from16 v6, p4

    invoke-virtual {v3, p0, v0, p2, v6}, Lb/h/f/j;->a(Landroid/content/Context;Lb/h/e/c/c$b;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;

    move-result-object v0

    if-eqz v1, :cond_65

    if-eqz v0, :cond_61

    .line 17
    invoke-virtual {v1, v0, v2}, Lb/h/e/c/f$a;->a(Landroid/graphics/Typeface;Landroid/os/Handler;)V

    goto :goto_65

    :cond_61
    const/4 v3, -0x3

    .line 18
    invoke-virtual {v1, v3, v2}, Lb/h/e/c/f$a;->a(ILandroid/os/Handler;)V

    :cond_65
    :goto_65
    if-eqz v0, :cond_70

    .line 19
    sget-object v1, Lb/h/f/d;->b:Lb/e/e;

    invoke-static/range {p2 .. p4}, Lb/h/f/d;->a(Landroid/content/res/Resources;II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lb/e/e;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_70
    return-object v0
.end method

.method public static a(Ljava/lang/String;)Landroid/graphics/Typeface;
    .registers 4

    const/4 v0, 0x0

    if-eqz p0, :cond_1e

    .line 2
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    goto :goto_1e

    :cond_a
    const/4 v1, 0x0

    .line 3
    invoke-static {p0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    .line 4
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-static {v2, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v1

    if-eqz p0, :cond_1e

    .line 5
    invoke-virtual {p0, v1}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    move-object v0, p0

    :cond_1e
    :goto_1e
    return-object v0
.end method

.method public static a(Landroid/content/res/Resources;II)Ljava/lang/String;
    .registers 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "-"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static b(Landroid/content/Context;Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    .registers 5

    .line 2
    sget-object v0, Lb/h/f/d;->a:Lb/h/f/j;

    invoke-virtual {v0, p1}, Lb/h/f/j;->a(Landroid/graphics/Typeface;)Lb/h/e/c/c$b;

    move-result-object p1

    if-nez p1, :cond_a

    const/4 p0, 0x0

    return-object p0

    .line 3
    :cond_a
    sget-object v0, Lb/h/f/d;->a:Lb/h/f/j;

    .line 4
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 5
    invoke-virtual {v0, p0, p1, v1, p2}, Lb/h/f/j;->a(Landroid/content/Context;Lb/h/e/c/c$b;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public static b(Landroid/content/res/Resources;II)Landroid/graphics/Typeface;
    .registers 4

    .line 1
    sget-object v0, Lb/h/f/d;->b:Lb/e/e;

    invoke-static {p0, p1, p2}, Lb/h/f/d;->a(Landroid/content/res/Resources;II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lb/e/e;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/Typeface;

    return-object p0
.end method
