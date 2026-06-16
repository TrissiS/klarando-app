.class public Lb/h/j/e$b;
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
.field public final synthetic a:Lb/h/j/a;


# direct methods
.method public constructor <init>(Lb/h/j/a;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/h/j/e$b;->a:Lb/h/j/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/h/j/e$e;)V
    .registers 3

    .line 2
    iget-object v0, p0, Lb/h/j/e$b;->a:Lb/h/j/a;

    invoke-virtual {v0, p1}, Lb/h/j/a;->a(Lb/h/j/e$e;)V

    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;)V
    .registers 2

    .line 1
    check-cast p1, Lb/h/j/e$e;

    invoke-virtual {p0, p1}, Lb/h/j/e$b;->a(Lb/h/j/e$e;)V

    return-void
.end method
