.class public Lb/h/j/e$c;
.super Ljava/lang/Object;
.source "FontRequestWorker.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


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
        "Ljava/util/concurrent/Callable<",
        "Lb/h/j/e$e;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Lb/h/j/d;

.field public final synthetic d:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;Lb/h/j/d;I)V
    .registers 5

    .line 1
    iput-object p1, p0, Lb/h/j/e$c;->a:Ljava/lang/String;

    iput-object p2, p0, Lb/h/j/e$c;->b:Landroid/content/Context;

    iput-object p3, p0, Lb/h/j/e$c;->c:Lb/h/j/d;

    iput p4, p0, Lb/h/j/e$c;->d:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lb/h/j/e$e;
    .registers 5

    .line 2
    iget-object v0, p0, Lb/h/j/e$c;->a:Ljava/lang/String;

    iget-object v1, p0, Lb/h/j/e$c;->b:Landroid/content/Context;

    iget-object v2, p0, Lb/h/j/e$c;->c:Lb/h/j/d;

    iget v3, p0, Lb/h/j/e$c;->d:I

    invoke-static {v0, v1, v2, v3}, Lb/h/j/e;->a(Ljava/lang/String;Landroid/content/Context;Lb/h/j/d;I)Lb/h/j/e$e;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lb/h/j/e$c;->call()Lb/h/j/e$e;

    move-result-object v0

    return-object v0
.end method
