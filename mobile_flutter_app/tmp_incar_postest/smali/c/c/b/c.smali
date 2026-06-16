.class public final Lc/c/b/c;
.super Ljava/lang/Object;
.source "Permission.java"


# static fields
.field public static final a:[Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 1
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lc/c/b/c;->a:[Ljava/lang/String;

    return-void
.end method
