.class public Ld/a/b/e/b$c;
.super Ld/a/b/g/l/c/m;
.source "LibsConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ld/a/b/e/b;->c()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ld/a/b/g/l/c/m;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Ld/a/b/g/l/f/b;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "CheckUpdate result: %s"

    .line 1
    invoke-static {v2, v1}, Lf/a/a;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2
    new-instance v1, Ld/a/b/g/l/f/b;

    invoke-direct {v1}, Ld/a/b/g/l/f/b;-><init>()V

    .line 3
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "data"

    .line 4
    invoke-virtual {v2, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v2, "fileUrl"

    .line 5
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "info"

    .line 6
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "versionCode"

    .line 7
    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    const-string v5, "versionName"

    .line 8
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "pkgName"

    .line 9
    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 10
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_41

    const/4 p1, 0x0

    return-object p1

    .line 11
    :cond_41
    invoke-virtual {v1, v2}, Ld/a/b/g/l/f/b;->c(Ljava/lang/String;)V

    .line 12
    invoke-virtual {v1, v3}, Ld/a/b/g/l/f/b;->b(Ljava/lang/String;)V

    .line 13
    invoke-virtual {v1, v0}, Ld/a/b/g/l/f/b;->a(Z)V

    .line 14
    invoke-virtual {v1, v4}, Ld/a/b/g/l/f/b;->a(I)V

    .line 15
    invoke-virtual {v1, v5}, Ld/a/b/g/l/f/b;->d(Ljava/lang/String;)V

    .line 16
    invoke-virtual {v1, p1}, Ld/a/b/g/l/f/b;->a(Ljava/lang/String;)V

    return-object v1
.end method
