.class public synthetic Lb/l/d/o$b;
.super Ljava/lang/Object;
.source "FragmentStateManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/l/d/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1009
    name = null
.end annotation


# static fields
.field public static final synthetic a:[I


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    .line 1
    invoke-static {}, Lb/n/e$c;->values()[Lb/n/e$c;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lb/l/d/o$b;->a:[I

    :try_start_9
    sget-object v1, Lb/n/e$c;->RESUMED:Lb/n/e$c;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_12} :catch_12

    :catch_12
    :try_start_12
    sget-object v0, Lb/l/d/o$b;->a:[I

    sget-object v1, Lb/n/e$c;->STARTED:Lb/n/e$c;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_1d} :catch_1d

    :catch_1d
    :try_start_1d
    sget-object v0, Lb/l/d/o$b;->a:[I

    sget-object v1, Lb/n/e$c;->CREATED:Lb/n/e$c;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_28
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1d .. :try_end_28} :catch_28

    :catch_28
    :try_start_28
    sget-object v0, Lb/l/d/o$b;->a:[I

    sget-object v1, Lb/n/e$c;->INITIALIZED:Lb/n/e$c;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_28 .. :try_end_33} :catch_33

    :catch_33
    return-void
.end method
