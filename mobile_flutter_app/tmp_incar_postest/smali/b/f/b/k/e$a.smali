.class public synthetic Lb/f/b/k/e$a;
.super Ljava/lang/Object;
.source "ConstraintWidget.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/b/k/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1009
    name = null
.end annotation


# static fields
.field public static final synthetic a:[I

.field public static final synthetic b:[I


# direct methods
.method public static constructor <clinit>()V
    .registers 6

    .line 1
    invoke-static {}, Lb/f/b/k/e$b;->values()[Lb/f/b/k/e$b;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lb/f/b/k/e$a;->b:[I

    const/4 v1, 0x1

    :try_start_a
    sget-object v2, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_12} :catch_12

    :catch_12
    const/4 v0, 0x2

    :try_start_13
    sget-object v2, Lb/f/b/k/e$a;->b:[I

    sget-object v3, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    aput v0, v2, v3
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13 .. :try_end_1d} :catch_1d

    :catch_1d
    const/4 v2, 0x3

    :try_start_1e
    sget-object v3, Lb/f/b/k/e$a;->b:[I

    sget-object v4, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_28
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1e .. :try_end_28} :catch_28

    :catch_28
    const/4 v3, 0x4

    :try_start_29
    sget-object v4, Lb/f/b/k/e$a;->b:[I

    sget-object v5, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    aput v3, v4, v5
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_29 .. :try_end_33} :catch_33

    .line 2
    :catch_33
    invoke-static {}, Lb/f/b/k/d$b;->values()[Lb/f/b/k/d$b;

    move-result-object v4

    array-length v4, v4

    new-array v4, v4, [I

    sput-object v4, Lb/f/b/k/e$a;->a:[I

    :try_start_3c
    sget-object v5, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    aput v1, v4, v5
    :try_end_44
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3c .. :try_end_44} :catch_44

    :catch_44
    :try_start_44
    sget-object v1, Lb/f/b/k/e$a;->a:[I

    sget-object v4, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    aput v0, v1, v4
    :try_end_4e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_44 .. :try_end_4e} :catch_4e

    :catch_4e
    :try_start_4e
    sget-object v0, Lb/f/b/k/e$a;->a:[I

    sget-object v1, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aput v2, v0, v1
    :try_end_58
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4e .. :try_end_58} :catch_58

    :catch_58
    :try_start_58
    sget-object v0, Lb/f/b/k/e$a;->a:[I

    sget-object v1, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aput v3, v0, v1
    :try_end_62
    .catch Ljava/lang/NoSuchFieldError; {:try_start_58 .. :try_end_62} :catch_62

    :catch_62
    :try_start_62
    sget-object v0, Lb/f/b/k/e$a;->a:[I

    sget-object v1, Lb/f/b/k/d$b;->BASELINE:Lb/f/b/k/d$b;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_6d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_62 .. :try_end_6d} :catch_6d

    :catch_6d
    :try_start_6d
    sget-object v0, Lb/f/b/k/e$a;->a:[I

    sget-object v1, Lb/f/b/k/d$b;->CENTER:Lb/f/b/k/d$b;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_78
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6d .. :try_end_78} :catch_78

    :catch_78
    :try_start_78
    sget-object v0, Lb/f/b/k/e$a;->a:[I

    sget-object v1, Lb/f/b/k/d$b;->CENTER_X:Lb/f/b/k/d$b;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_83
    .catch Ljava/lang/NoSuchFieldError; {:try_start_78 .. :try_end_83} :catch_83

    :catch_83
    :try_start_83
    sget-object v0, Lb/f/b/k/e$a;->a:[I

    sget-object v1, Lb/f/b/k/d$b;->CENTER_Y:Lb/f/b/k/d$b;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_8f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_83 .. :try_end_8f} :catch_8f

    :catch_8f
    :try_start_8f
    sget-object v0, Lb/f/b/k/e$a;->a:[I

    sget-object v1, Lb/f/b/k/d$b;->NONE:Lb/f/b/k/d$b;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_9b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8f .. :try_end_9b} :catch_9b

    :catch_9b
    return-void
.end method
