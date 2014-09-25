.class final Lorg/openintents/openpgp/OpenPgpSignatureResult$1;
.super Ljava/lang/Object;
.source "OpenPgpSignatureResult.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/OpenPgpSignatureResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lorg/openintents/openpgp/OpenPgpSignatureResult;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 148
    invoke-virtual {p0, p1}, Lorg/openintents/openpgp/OpenPgpSignatureResult$1;->createFromParcel(Landroid/os/Parcel;)Lorg/openintents/openpgp/OpenPgpSignatureResult;

    move-result-object v0

    return-object v0
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lorg/openintents/openpgp/OpenPgpSignatureResult;
    .locals 6
    .parameter "source"

    .prologue
    const/4 v4, 0x1

    .line 150
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 151
    .local v1, parcelableVersion:I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 152
    .local v0, parcelableSize:I
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 154
    .local v2, startPosition:I
    new-instance v3, Lorg/openintents/openpgp/OpenPgpSignatureResult;

    invoke-direct {v3}, Lorg/openintents/openpgp/OpenPgpSignatureResult;-><init>()V

    .line 155
    .local v3, vr:Lorg/openintents/openpgp/OpenPgpSignatureResult;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    iput v5, v3, Lorg/openintents/openpgp/OpenPgpSignatureResult;->status:I

    .line 156
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v5

    if-ne v5, v4, :cond_0

    :goto_0
    iput-boolean v4, v3, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    .line 157
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    .line 158
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    iput-wide v4, v3, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    .line 159
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, v3, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    .line 160
    iget-object v4, v3, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->readStringList(Ljava/util/List;)V

    .line 163
    add-int v4, v2, v0

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 165
    return-object v3

    .line 156
    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 148
    invoke-virtual {p0, p1}, Lorg/openintents/openpgp/OpenPgpSignatureResult$1;->newArray(I)[Lorg/openintents/openpgp/OpenPgpSignatureResult;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lorg/openintents/openpgp/OpenPgpSignatureResult;
    .locals 1
    .parameter "size"

    .prologue
    .line 169
    new-array v0, p1, [Lorg/openintents/openpgp/OpenPgpSignatureResult;

    return-object v0
.end method
