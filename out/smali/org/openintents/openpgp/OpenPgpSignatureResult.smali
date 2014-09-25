.class public Lorg/openintents/openpgp/OpenPgpSignatureResult;
.super Ljava/lang/Object;
.source "OpenPgpSignatureResult.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/openintents/openpgp/OpenPgpSignatureResult;",
            ">;"
        }
    .end annotation
.end field

.field public static final PARCELABLE_VERSION:I = 0x2

.field public static final SIGNATURE_ERROR:I = 0x0

.field public static final SIGNATURE_KEY_EXPIRED:I = 0x5

.field public static final SIGNATURE_KEY_MISSING:I = 0x2

.field public static final SIGNATURE_KEY_REVOKED:I = 0x4

.field public static final SIGNATURE_SUCCESS_CERTIFIED:I = 0x1

.field public static final SIGNATURE_SUCCESS_UNCERTIFIED:I = 0x3


# instance fields
.field keyId:J

.field primaryUserId:Ljava/lang/String;

.field signatureOnly:Z

.field status:I

.field userIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 148
    new-instance v0, Lorg/openintents/openpgp/OpenPgpSignatureResult$1;

    invoke-direct {v0}, Lorg/openintents/openpgp/OpenPgpSignatureResult$1;-><init>()V

    sput-object v0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;ZJLjava/util/ArrayList;)V
    .locals 0
    .parameter "signatureStatus"
    .parameter "signatureUserId"
    .parameter "signatureOnly"
    .parameter "keyId"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "ZJ",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 103
    .local p6, userIds:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    iput p1, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->status:I

    .line 105
    iput-boolean p3, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    .line 106
    iput-object p2, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    .line 107
    iput-wide p4, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    .line 108
    iput-object p6, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    .line 109
    return-void
.end method

.method public constructor <init>(Lorg/openintents/openpgp/OpenPgpSignatureResult;)V
    .locals 2
    .parameter "b"

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iget v0, p1, Lorg/openintents/openpgp/OpenPgpSignatureResult;->status:I

    iput v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->status:I

    .line 113
    iget-object v0, p1, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    iput-object v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    .line 114
    iget-boolean v0, p1, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    iput-boolean v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    .line 115
    iget-wide v0, p1, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    iput-wide v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    .line 116
    iget-object v0, p1, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    iput-object v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    .line 117
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x0

    return v0
.end method

.method public getKeyId()J
    .locals 2

    .prologue
    .line 91
    iget-wide v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    return-wide v0
.end method

.method public getPrimaryUserId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    return-object v0
.end method

.method public getStatus()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->status:I

    return v0
.end method

.method public getUserIds()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    return-object v0
.end method

.method public isSignatureOnly()Z
    .locals 1

    .prologue
    .line 67
    iget-boolean v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    return v0
.end method

.method public setKeyId(J)V
    .locals 0
    .parameter "keyId"

    .prologue
    .line 95
    iput-wide p1, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    .line 96
    return-void
.end method

.method public setPrimaryUserId(Ljava/lang/String;)V
    .locals 0
    .parameter "primaryUserId"

    .prologue
    .line 79
    iput-object p1, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    .line 80
    return-void
.end method

.method public setSignatureOnly(Z)V
    .locals 0
    .parameter "signatureOnly"

    .prologue
    .line 71
    iput-boolean p1, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    .line 72
    return-void
.end method

.method public setStatus(I)V
    .locals 0
    .parameter "status"

    .prologue
    .line 63
    iput p1, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->status:I

    .line 64
    return-void
.end method

.method public setUserIds(Ljava/util/ArrayList;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 87
    .local p1, userIds:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    .line 88
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 175
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\nstatus: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->status:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 176
    .local v0, out:Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nprimaryUserId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 177
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nuserIds: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 178
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nsignatureOnly: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 179
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nkeyId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    invoke-static {v2, v3}, Lorg/openintents/openpgp/util/OpenPgpUtils;->convertKeyIdToHex(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 180
    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 5
    .parameter "dest"
    .parameter "flags"

    .prologue
    const/4 v3, 0x0

    .line 128
    const/4 v4, 0x2

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 131
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 132
    .local v1, sizePosition:I
    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 133
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 135
    .local v2, startPosition:I
    iget v4, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->status:I

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 136
    iget-boolean v4, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    if-eqz v4, :cond_0

    const/4 v3, 0x1

    :cond_0
    int-to-byte v3, v3

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeByte(B)V

    .line 137
    iget-object v3, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 138
    iget-wide v3, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    invoke-virtual {p1, v3, v4}, Landroid/os/Parcel;->writeLong(J)V

    .line 140
    iget-object v3, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 142
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    sub-int v0, v3, v2

    .line 143
    .local v0, parcelableSize:I
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 144
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 145
    add-int v3, v2, v0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 146
    return-void
.end method
