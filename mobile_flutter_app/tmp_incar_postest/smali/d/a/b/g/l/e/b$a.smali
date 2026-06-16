.class public Ld/a/b/g/l/e/b$a;
.super Ljava/lang/Object;
.source "DefaultDownloadNotifier.java"

# interfaces
.implements Ld/a/b/g/l/c/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ld/a/b/g/l/e/b;->a(Ld/a/b/g/l/f/b;Landroid/app/Activity;)Ld/a/b/g/l/c/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/app/ProgressDialog;

.field public final synthetic b:Ld/a/b/g/l/e/b;


# direct methods
.method public constructor <init>(Ld/a/b/g/l/e/b;Landroid/app/ProgressDialog;)V
    .registers 3

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/e/b$a;->b:Ld/a/b/g/l/e/b;

    iput-object p2, p0, Ld/a/b/g/l/e/b$a;->a:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(JJ)V
    .registers 5

    long-to-float p1, p1

    const/high16 p2, 0x3f800000    # 1.0f

    mul-float p1, p1, p2

    long-to-float p2, p3

    div-float/2addr p1, p2

    const/high16 p2, 0x42c80000    # 100.0f

    mul-float p1, p1, p2

    float-to-int p1, p1

    .line 2
    iget-object p2, p0, Ld/a/b/g/l/e/b$a;->a:Landroid/app/ProgressDialog;

    invoke-virtual {p2, p1}, Landroid/app/ProgressDialog;->setProgress(I)V

    return-void
.end method

.method public a(Ljava/io/File;)V
    .registers 2

    .line 1
    iget-object p1, p0, Ld/a/b/g/l/e/b$a;->a:Landroid/app/ProgressDialog;

    invoke-static {p1}, Ld/a/b/g/l/g/c;->b(Landroid/app/Dialog;)V

    return-void
.end method

.method public a(Ljava/lang/Throwable;)V
    .registers 2

    .line 3
    iget-object p1, p0, Ld/a/b/g/l/e/b$a;->a:Landroid/app/ProgressDialog;

    invoke-static {p1}, Ld/a/b/g/l/g/c;->b(Landroid/app/Dialog;)V

    .line 4
    iget-object p1, p0, Ld/a/b/g/l/e/b$a;->b:Ld/a/b/g/l/e/b;

    invoke-static {p1}, Ld/a/b/g/l/e/b;->a(Ld/a/b/g/l/e/b;)V

    return-void
.end method

.method public b()V
    .registers 1

    return-void
.end method
