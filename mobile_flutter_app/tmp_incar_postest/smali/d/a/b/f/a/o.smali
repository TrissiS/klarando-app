.class public final synthetic Ld/a/b/f/a/o;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic h:Lnet/nyx/postest/ui/activity/PrintActivity;

.field private final synthetic i:I

.field private final synthetic j:I

.field private final synthetic k:Landroid/graphics/Bitmap;

.field private final synthetic l:I


# direct methods
.method public synthetic constructor <init>(Lnet/nyx/postest/ui/activity/PrintActivity;IILandroid/graphics/Bitmap;I)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/b/f/a/o;->h:Lnet/nyx/postest/ui/activity/PrintActivity;

    iput p2, p0, Ld/a/b/f/a/o;->i:I

    iput p3, p0, Ld/a/b/f/a/o;->j:I

    iput-object p4, p0, Ld/a/b/f/a/o;->k:Landroid/graphics/Bitmap;

    iput p5, p0, Ld/a/b/f/a/o;->l:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    iget-object v0, p0, Ld/a/b/f/a/o;->h:Lnet/nyx/postest/ui/activity/PrintActivity;

    iget v1, p0, Ld/a/b/f/a/o;->i:I

    iget v2, p0, Ld/a/b/f/a/o;->j:I

    iget-object v3, p0, Ld/a/b/f/a/o;->k:Landroid/graphics/Bitmap;

    iget v4, p0, Ld/a/b/f/a/o;->l:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lnet/nyx/postest/ui/activity/PrintActivity;->a(IILandroid/graphics/Bitmap;I)V

    return-void
.end method
