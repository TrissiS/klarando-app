.class public Lb/h/j/e$d;
.super Ljava/lang/Object;
.source "FontRequestWorker.java"

# interfaces
.implements Lb/h/l/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/h/j/e;->a(Landroid/content/Context;Lb/h/j/d;ILjava/util/concurrent/Executor;Lb/h/j/a;)Landroid/graphics/Typeface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lb/h/l/a<",
        "Lb/h/j/e$e;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/h/j/e$d;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/h/j/e$e;)V
    .registers 6

    .line 2
    sget-object v0, Lb/h/j/e;->c:Ljava/lang/Object;

    monitor-enter v0

    .line 3
    :try_start_3
    sget-object v1, Lb/h/j/e;->d:Lb/e/g;

    iget-object v2, p0, Lb/h/j/e$d;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    if-nez v1, :cond_11

    .line 4
    monitor-exit v0

    return-void

    .line 5
    :cond_11
    sget-object v2, Lb/h/j/e;->d:Lb/e/g;

    iget-object v3, p0, Lb/h/j/e$d;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lb/e/g;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    monitor-exit v0
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_2d

    const/4 v0, 0x0

    .line 7
    :goto_1a
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_2c

    .line 8
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/h/l/a;

    invoke-interface {v2, p1}, Lb/h/l/a;->a(Ljava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    :cond_2c
    return-void

    :catchall_2d
    move-exception p1

    .line 9
    :try_start_2e
    monitor-exit v0
    :try_end_2f
    .catchall {:try_start_2e .. :try_end_2f} :catchall_2d

    throw p1
.end method

.method public bridge synthetic a(Ljava/lang/Object;)V
    .registers 2

    .line 1
    check-cast p1, Lb/h/j/e$e;

    invoke-virtual {p0, p1}, Lb/h/j/e$d;->a(Lb/h/j/e$e;)V

    return-void
.end method
