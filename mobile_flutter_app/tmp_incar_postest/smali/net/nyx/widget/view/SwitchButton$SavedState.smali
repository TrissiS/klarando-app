.class public final Lnet/nyx/widget/view/SwitchButton$SavedState;
.super Landroid/view/View$BaseSavedState;
.source "SwitchButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/nyx/widget/view/SwitchButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lnet/nyx/widget/view/SwitchButton$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public h:Z


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Lnet/nyx/widget/view/SwitchButton$SavedState$a;

    invoke-direct {v0}, Lnet/nyx/widget/view/SwitchButton$SavedState$a;-><init>()V

    sput-object v0, Lnet/nyx/widget/view/SwitchButton$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 3

    .line 3
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 4
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    const/4 v0, 0x1

    if-ne v0, p1, :cond_b

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    iput-boolean v0, p0, Lnet/nyx/widget/view/SwitchButton$SavedState;->h:Z

    return-void
.end method

.method public synthetic constructor <init>(Landroid/os/Parcel;Lnet/nyx/widget/view/SwitchButton$a;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Lnet/nyx/widget/view/SwitchButton$SavedState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcelable;)V
    .registers 2

    .line 2
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    return-void
.end method

.method public static synthetic a(Lnet/nyx/widget/view/SwitchButton$SavedState;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lnet/nyx/widget/view/SwitchButton$SavedState;->h:Z

    return p0
.end method

.method public static synthetic a(Lnet/nyx/widget/view/SwitchButton$SavedState;Z)Z
    .registers 2

    .line 2
    iput-boolean p1, p0, Lnet/nyx/widget/view/SwitchButton$SavedState;->h:Z

    return p1
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 2
    iget-boolean p2, p0, Lnet/nyx/widget/view/SwitchButton$SavedState;->h:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
