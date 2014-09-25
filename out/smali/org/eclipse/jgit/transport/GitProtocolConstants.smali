.class public Lorg/eclipse/jgit/transport/GitProtocolConstants;
.super Ljava/lang/Object;
.source "GitProtocolConstants.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;
    }
.end annotation


# static fields
.field public static final CAPABILITY_DELETE_REFS:Ljava/lang/String; = "delete-refs"

.field public static final CAPABILITY_OFS_DELTA:Ljava/lang/String; = "ofs-delta"

.field public static final CAPABILITY_REPORT_STATUS:Ljava/lang/String; = "report-status"

.field public static final CAPABILITY_SIDE_BAND_64K:Ljava/lang/String; = "side-band-64k"

.field public static final OPTION_ALLOW_TIP_SHA1_IN_WANT:Ljava/lang/String; = "allow-tip-sha1-in-want"

.field public static final OPTION_INCLUDE_TAG:Ljava/lang/String; = "include-tag"

.field public static final OPTION_MULTI_ACK:Ljava/lang/String; = "multi_ack"

.field public static final OPTION_MULTI_ACK_DETAILED:Ljava/lang/String; = "multi_ack_detailed"

.field public static final OPTION_NO_DONE:Ljava/lang/String; = "no-done"

.field public static final OPTION_NO_PROGRESS:Ljava/lang/String; = "no-progress"

.field public static final OPTION_OFS_DELTA:Ljava/lang/String; = "ofs-delta"

.field public static final OPTION_SHALLOW:Ljava/lang/String; = "shallow"

.field public static final OPTION_SIDE_BAND:Ljava/lang/String; = "side-band"

.field public static final OPTION_SIDE_BAND_64K:Ljava/lang/String; = "side-band-64k"

.field public static final OPTION_THIN_PACK:Ljava/lang/String; = "thin-pack"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 165
    return-void
.end method
