.class public Ld/a/b/g/j;
.super Ljava/lang/Object;
.source "SpUtils.java"


# static fields
.field public static a:Landroid/content/SharedPreferences; = null

.field public static b:Landroid/content/SharedPreferences$Editor; = null

.field public static c:Ljava/lang/String; = "config"

.field public static d:Ld/a/b/g/j;


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sget-object v0, Ld/a/b/g/j;->c:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    sput-object p1, Ld/a/b/g/j;->a:Landroid/content/SharedPreferences;

    .line 3
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    sput-object p1, Ld/a/b/g/j;->b:Landroid/content/SharedPreferences$Editor;

    return-void
.end method

.method public static a()Ld/a/b/g/j;
    .registers 3

    .line 1
    sget-object v0, Ld/a/b/g/j;->d:Ld/a/b/g/j;

    if-nez v0, :cond_1b

    .line 2
    const-class v0, Ld/a/b/g/j;

    monitor-enter v0

    .line 3
    :try_start_7
    sget-object v1, Ld/a/b/g/j;->d:Ld/a/b/g/j;

    if-nez v1, :cond_16

    .line 4
    new-instance v1, Ld/a/b/g/j;

    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v2

    invoke-direct {v1, v2}, Ld/a/b/g/j;-><init>(Landroid/content/Context;)V

    sput-object v1, Ld/a/b/g/j;->d:Ld/a/b/g/j;

    .line 5
    :cond_16
    monitor-exit v0

    goto :goto_1b

    :catchall_18
    move-exception v1

    monitor-exit v0
    :try_end_1a
    .catchall {:try_start_7 .. :try_end_1a} :catchall_18

    throw v1

    .line 6
    :cond_1b
    :goto_1b
    sget-object v0, Ld/a/b/g/j;->d:Ld/a/b/g/j;

    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;J)J
    .registers 5

    .line 9
    sget-object v0, Ld/a/b/g/j;->a:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2, p3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide p1

    return-wide p1
.end method

.method public a(Ljava/lang/String;Ljava/lang/Long;)V
    .registers 6

    .line 7
    sget-object v0, Ld/a/b/g/j;->b:Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, p1, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 8
    sget-object p1, Ld/a/b/g/j;->b:Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
