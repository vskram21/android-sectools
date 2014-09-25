.class public Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;
.super Ljava/lang/Object;
.source "DeltaIndex.java"


# static fields
.field static final BLKSZ:I = 0x10

.field private static final MAX_CHAIN_LENGTH:I = 0x40

.field private static final T:[I

.field private static final U:[I


# instance fields
.field private final entries:[J

.field private final src:[B

.field private final table:[I

.field private final tableMask:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0x100

    .line 482
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->T:[I

    .line 535
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->U:[I

    return-void

    .line 482
    nop

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x2dt 0xb3t 0xc6t 0xd4t
        0x77t 0xd5t 0x4bt 0x7dt
        0x5at 0x66t 0x8dt 0xa9t
        0xc3t 0x19t 0x51t 0x2et
        0xeet 0xaat 0x97t 0xfat
        0xb4t 0xcct 0x1at 0x53t
        0x99t 0x7ft 0xdct 0x87t
        0x86t 0x33t 0xa2t 0x5ct
        0xabt 0x80t 0x64t 0x88t
        0xf1t 0xe6t 0xe9t 0x21t
        0xdct 0x55t 0x2ft 0xf5t
        0x45t 0x2at 0xf3t 0x72t
        0x68t 0x99t 0x35t 0xa6t
        0x32t 0xfft 0xb8t 0xft
        0x1ft 0x4ct 0x7et 0xdbt
        0x21t 0xd4t 0x82t 0x6dt
        0xct 0x67t 0x44t 0xb9t
        0x56t 0x1t 0xc9t 0x10t
        0x7bt 0xb2t 0xft 0xc4t
        0xe2t 0xcdt 0xd3t 0x43t
        0xcft 0x7et 0x15t 0x97t
        0x95t 0x18t 0x98t 0x3et
        0xb8t 0xabt 0x5et 0xeat
        0xa7t 0xe7t 0x20t 0x31t
        0x8at 0x54t 0xe6t 0xe5t
        0xd0t 0x32t 0x6bt 0x4ct
        0xfdt 0x81t 0xadt 0x98t
        0x64t 0xfet 0x71t 0x1ft
        0x49t 0x4dt 0xb7t 0xcbt
        0x13t 0x2bt 0x3at 0x62t
        0x3et 0x98t 0xfct 0xb6t
        0x6ft 0x1bt 0xc3t 0xft
        0x42t 0xa8t 0x5t 0xdbt
        0x18t 0xcet 0x88t 0x72t
        0x35t 0x7dt 0x4et 0xa6t
        0xact 0x2t 0x92t 0x21t
        0x81t 0xb1t 0x54t 0xf5t
        0xdbt 0xd7t 0xd9t 0x5ct
        0xf6t 0x64t 0x1ft 0x88t
        0xe9t 0x28t 0x61t 0x53t
        0xc4t 0x9bt 0xa7t 0x87t
        0x9et 0xfdt 0x2at 0x2et
        0xb3t 0x4et 0xect 0xfat
        0x2at 0x31t 0x30t 0x7dt
        0x7t 0x82t 0xf6t 0xa9t
        0x5dt 0xe4t 0x7bt 0x0t
        0x70t 0x57t 0xbdt 0xd4t
        0x4et 0xcft 0x41t 0x62t
        0x63t 0x7ct 0x87t 0xb6t
        0x39t 0x1at 0xat 0x1ft
        0x14t 0xa9t 0xcct 0xcbt
        0x8dt 0xd6t 0x10t 0x4ct
        0xa0t 0x65t 0xd6t 0x98t
        0xfat 0x3t 0x5bt 0x31t
        0xd7t 0xb0t 0x9dt 0xe5t
        0xc8t 0xfct 0xe3t 0x3et
        0xe5t 0x4ft 0x25t 0xeat
        0xbft 0x29t 0xa8t 0x43t
        0x92t 0x9at 0x6et 0x97t
        0xbt 0xe5t 0xb2t 0x10t
        0x26t 0x56t 0x74t 0xc4t
        0x7ct 0x30t 0xf9t 0x6dt
        0x51t 0x83t 0x3ft 0xb9t
        0xdet 0x36t 0x86t 0x1ft
        0xf3t 0x85t 0x40t 0xcbt
        0xa9t 0xe3t 0xcdt 0x62t
        0x84t 0x50t 0xbt 0xb6t
        0x1dt 0x2ft 0xd7t 0x31t
        0x30t 0x9ct 0x11t 0xe5t
        0x6at 0xfat 0x9ct 0x4ct
        0x47t 0x49t 0x5at 0x98t
        0x58t 0x5t 0x24t 0x43t
        0x75t 0xb6t 0xe2t 0x97t
        0x2ft 0xd0t 0x6ft 0x3et
        0x2t 0x63t 0xa9t 0xeat
        0x9bt 0x1ct 0x75t 0x6dt
        0xb6t 0xaft 0xb3t 0xb9t
        0xect 0xc9t 0x3et 0x10t
        0xc1t 0x7at 0xf8t 0xc4t
        0xfft 0xe2t 0x4t 0x72t
        0xd2t 0x51t 0xc2t 0xa6t
        0x88t 0x37t 0x4ft 0xft
        0xa5t 0x84t 0x89t 0xdbt
        0x3ct 0xfbt 0x55t 0x5ct
        0x11t 0x48t 0x93t 0x88t
        0x4bt 0x2et 0x1et 0x21t
        0x66t 0x9dt 0xd8t 0xf5t
        0x79t 0xd1t 0xa6t 0x2et
        0x54t 0x62t 0x60t 0xfat
        0xet 0x4t 0xedt 0x53t
        0x23t 0xb7t 0x2bt 0x87t
        0xbat 0xc8t 0xf7t 0x0t
        0x97t 0x7bt 0x31t 0xd4t
        0xcdt 0x1dt 0xbct 0x7dt
        0xe0t 0xaet 0x7at 0xa9t
        0xb1t 0x2dt 0x45t 0x10t
        0x9ct 0x9et 0x83t 0xc4t
        0xc6t 0xf8t 0xet 0x6dt
        0xebt 0x4bt 0xc8t 0xb9t
        0x72t 0x34t 0x14t 0x3et
        0x5ft 0x87t 0xd2t 0xeat
        0x5t 0xe1t 0x5ft 0x43t
        0x28t 0x52t 0x99t 0x97t
        0x37t 0x1et 0xe7t 0x4ct
        0x1at 0xadt 0x21t 0x98t
        0x40t 0xcbt 0xact 0x31t
        0x6dt 0x78t 0x6at 0xe5t
        0xf4t 0x7t 0xb6t 0x62t
        0xd9t 0xb4t 0x70t 0xb6t
        0x83t 0xd2t 0xfdt 0x1ft
        0xaet 0x61t 0x3bt 0xcbt
        0x90t 0xf9t 0xc7t 0x7dt
        0xbdt 0x4at 0x1t 0xa9t
        0xe7t 0x2ct 0x8ct 0x0t
        0xcat 0x9ft 0x4at 0xd4t
        0x53t 0xe0t 0x96t 0x53t
        0x7et 0x53t 0x50t 0x87t
        0x24t 0x35t 0xddt 0x2et
        0x9t 0x86t 0x1bt 0xfat
        0x16t 0xcat 0x65t 0x21t
        0x3bt 0x79t 0xa3t 0xf5t
        0x61t 0x1ft 0x2et 0x5ct
        0x4ct 0xact 0xe8t 0x88t
        0xd5t 0xd3t 0x34t 0xft
        0xf8t 0x60t 0xf2t 0xdbt
        0xa2t 0x6t 0x7ft 0x72t
        0x8ft 0xb5t 0xb9t 0xa6t
        0xbct 0x6dt 0xct 0x3ft
        0x91t 0xdet 0xcat 0xebt
        0xcbt 0xb8t 0x47t 0x42t
        0xe6t 0xbt 0x81t 0x96t
        0x7ft 0x74t 0x5dt 0x11t
        0x52t 0xc7t 0x9bt 0xc5t
        0x8t 0xa1t 0x16t 0x6ct
        0x25t 0x12t 0xd0t 0xb8t
        0x3at 0x5et 0xaet 0x63t
        0x17t 0xedt 0x68t 0xb7t
        0x4dt 0x8bt 0xe5t 0x1et
        0x60t 0x38t 0x23t 0xcat
        0xf9t 0x47t 0xfft 0x4dt
        0xd4t 0xf4t 0x39t 0x99t
        0x8et 0x92t 0xb4t 0x30t
        0xa3t 0x21t 0x72t 0xe4t
        0x9dt 0xb9t 0x8et 0x52t
        0xb0t 0xat 0x48t 0x86t
        0xeat 0x6ct 0xc5t 0x2ft
        0xc7t 0xdft 0x3t 0xfbt
        0x5et 0xa0t 0xdft 0x7ct
        0x73t 0x13t 0x19t 0xa8t
        0x29t 0x75t 0x94t 0x1t
        0x4t 0xc6t 0x52t 0xd5t
        0x1bt 0x8at 0x2ct 0xet
        0x36t 0x39t 0xeat 0xdat
        0x6ct 0x5ft 0x67t 0x73t
        0x41t 0xect 0xa1t 0xa7t
        0xd8t 0x93t 0x7dt 0x20t
        0xf5t 0x20t 0xbbt 0xf4t
        0xaft 0x46t 0x36t 0x5dt
        0x82t 0xf5t 0xf0t 0x89t
        0xd3t 0x76t 0xcft 0x30t
        0xfet 0xc5t 0x9t 0xe4t
        0xa4t 0xa3t 0x84t 0x4dt
        0x89t 0x10t 0x42t 0x99t
        0x10t 0x6ft 0x9et 0x1et
        0x3dt 0xdct 0x58t 0xcat
        0x67t 0xbat 0xd5t 0x63t
        0x4at 0x9t 0x13t 0xb7t
        0x55t 0x45t 0x6dt 0x6ct
        0x78t 0xf6t 0xabt 0xb8t
        0x22t 0x90t 0x26t 0x11t
        0xft 0x23t 0xe0t 0xc5t
        0x96t 0x5ct 0x3ct 0x42t
        0xbbt 0xeft 0xfat 0x96t
        0xe1t 0x89t 0x77t 0x3ft
        0xcct 0x3at 0xb1t 0xebt
        0xf2t 0xa2t 0x4dt 0x5dt
        0xdft 0x11t 0x8bt 0x89t
        0x85t 0x77t 0x6t 0x20t
        0xa8t 0xc4t 0xc0t 0xf4t
        0x31t 0xbbt 0x1ct 0x73t
        0x1ct 0x8t 0xdat 0xa7t
        0x46t 0x6et 0x57t 0xet
        0x6bt 0xddt 0x91t 0xdat
        0x74t 0x91t 0xeft 0x1t
        0x59t 0x22t 0x29t 0xd5t
        0x3t 0x44t 0xa4t 0x7ct
        0x2et 0xf7t 0x62t 0xa8t
        0xb7t 0x88t 0xbet 0x2ft
        0x9at 0x3bt 0x78t 0xfbt
        0xc0t 0x5dt 0xf5t 0x52t
        0xedt 0xeet 0x33t 0x86t
        0x62t 0x5bt 0x8at 0x20t
        0x4ft 0xe8t 0x4ct 0xf4t
        0x15t 0x8et 0xc1t 0x5dt
        0x38t 0x3dt 0x7t 0x89t
        0xa1t 0x42t 0xdbt 0xet
        0x8ct 0xf1t 0x1dt 0xdat
        0xd6t 0x97t 0x90t 0x73t
        0xfbt 0x24t 0x56t 0xa7t
        0xe4t 0x68t 0x28t 0x7ct
        0xc9t 0xdbt 0xeet 0xa8t
        0x93t 0xbdt 0x63t 0x1t
        0xbet 0xet 0xa5t 0xd5t
        0x27t 0x71t 0x79t 0x52t
        0xat 0xc2t 0xbft 0x86t
        0x50t 0xa4t 0x32t 0x2ft
        0x7dt 0x17t 0xf4t 0xfbt
        0x43t 0x8ft 0x8t 0x4dt
        0x6et 0x3ct 0xcet 0x99t
        0x34t 0x5at 0x43t 0x30t
        0x19t 0xe9t 0x85t 0xe4t
        0x80t 0x96t 0x59t 0x63t
        0xadt 0x25t 0x9ft 0xb7t
        0xf7t 0x43t 0x12t 0x1et
        0xdat 0xf0t 0xd4t 0xcat
        0xc5t 0xbct 0xaat 0x11t
        0xe8t 0xft 0x6ct 0xc5t
        0xb2t 0x69t 0xe1t 0x6ct
        0x9ft 0xdat 0x27t 0xb8t
        0x6t 0xa5t 0xfbt 0x3ft
        0x2bt 0x16t 0x3dt 0xebt
        0x71t 0x70t 0xb0t 0x42t
        0x5ct 0xc3t 0x76t 0x96t
        0xdt 0x40t 0x49t 0x2ft
        0x20t 0xf3t 0x8ft 0xfbt
        0x7at 0x95t 0x2t 0x52t
        0x57t 0x26t 0xc4t 0x86t
        0xcet 0x59t 0x18t 0x1t
        0xe3t 0xeat 0xdet 0xd5t
        0xb9t 0x8ct 0x53t 0x7ct
        0x94t 0x3ft 0x95t 0xa8t
        0x8bt 0x73t 0xebt 0x73t
        0xa6t 0xc0t 0x2dt 0xa7t
        0xfct 0xa6t 0xa0t 0xet
        0xd1t 0x15t 0x66t 0xdat
        0x48t 0x6at 0xbat 0x5dt
        0x65t 0xd9t 0x7ct 0x89t
        0x3ft 0xbft 0xf1t 0x20t
        0x12t 0xct 0x37t 0xf4t
        0x2ct 0x94t 0xcbt 0x42t
        0x1t 0x27t 0xdt 0x96t
        0x5bt 0x41t 0x80t 0x3ft
        0x76t 0xf2t 0x46t 0xebt
        0xeft 0x8dt 0x9at 0x6ct
        0xc2t 0x3et 0x5ct 0xb8t
        0x98t 0x58t 0xd1t 0x11t
        0xb5t 0xebt 0x17t 0xc5t
        0xaat 0xa7t 0x69t 0x1et
        0x87t 0x14t 0xaft 0xcat
        0xddt 0x72t 0x22t 0x63t
        0xf0t 0xc1t 0xe4t 0xb7t
        0x69t 0xbet 0x38t 0x30t
        0x44t 0xdt 0xfet 0xe4t
        0x1et 0x6bt 0x73t 0x4dt
        0x33t 0xd8t 0xb5t 0x99t
    .end array-data

    .line 535
    :array_1
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0xft 0xe9t 0xc6t 0x12t
        0x1et 0xd2t 0x8dt 0x25t
        0x11t 0x3bt 0x4bt 0x37t
        0x3ct 0xa4t 0x1bt 0x4bt
        0x33t 0x4dt 0xddt 0x59t
        0x22t 0x76t 0x96t 0x6et
        0x2dt 0x9ft 0x50t 0x7ct
        0x55t 0xfbt 0xf1t 0x42t
        0x5at 0x12t 0x37t 0x50t
        0x4bt 0x29t 0x7ct 0x67t
        0x44t 0xc0t 0xbat 0x75t
        0x69t 0x5ft 0xeat 0x9t
        0x66t 0xb6t 0x2ct 0x1bt
        0x77t 0x8dt 0x67t 0x2ct
        0x78t 0x64t 0xa1t 0x3et
        0x87t 0x45t 0x25t 0x51t
        0x88t 0xact 0xe3t 0x43t
        0x99t 0x97t 0xa8t 0x74t
        0x96t 0x7et 0x6et 0x66t
        0xbbt 0xe1t 0x3et 0x1at
        0xb4t 0x8t 0xf8t 0x8t
        0xa5t 0x33t 0xb3t 0x3ft
        0xaat 0xdat 0x75t 0x2dt
        0xd2t 0xbet 0xd4t 0x13t
        0xddt 0x57t 0x12t 0x1t
        0xcct 0x6ct 0x59t 0x36t
        0xc3t 0x85t 0x9ft 0x24t
        0xeet 0x1at 0xcft 0x58t
        0xe1t 0xf3t 0x9t 0x4at
        0xf0t 0xc8t 0x42t 0x7dt
        0xfft 0x21t 0x84t 0x6ft
        0x23t 0x38t 0x8ct 0x76t
        0x2ct 0xd1t 0x4at 0x64t
        0x3dt 0xeat 0x1t 0x53t
        0x32t 0x3t 0xc7t 0x41t
        0x1ft 0x9ct 0x97t 0x3dt
        0x10t 0x75t 0x51t 0x2ft
        0x1t 0x4et 0x1at 0x18t
        0xet 0xa7t 0xdct 0xat
        0x76t 0xc3t 0x7dt 0x34t
        0x79t 0x2at 0xbbt 0x26t
        0x68t 0x11t 0xf0t 0x11t
        0x67t 0xf8t 0x36t 0x3t
        0x4at 0x67t 0x66t 0x7ft
        0x45t 0x8et 0xa0t 0x6dt
        0x54t 0xb5t 0xebt 0x5at
        0x5bt 0x5ct 0x2dt 0x48t
        0xa4t 0x7dt 0xa9t 0x27t
        0xabt 0x94t 0x6ft 0x35t
        0xbat 0xaft 0x24t 0x2t
        0xb5t 0x46t 0xe2t 0x10t
        0x98t 0xd9t 0xb2t 0x6ct
        0x97t 0x30t 0x74t 0x7et
        0x86t 0xbt 0x3ft 0x49t
        0x89t 0xe2t 0xf9t 0x5bt
        0xf1t 0x86t 0x58t 0x65t
        0xfet 0x6ft 0x9et 0x77t
        0xeft 0x54t 0xd5t 0x40t
        0xe0t 0xbdt 0x13t 0x52t
        0xcdt 0x22t 0x43t 0x2et
        0xc2t 0xcbt 0x85t 0x3ct
        0xd3t 0xf0t 0xcet 0xbt
        0xdct 0x19t 0x8t 0x19t
        0x6bt 0xc3t 0xdet 0x39t
        0x64t 0x2at 0x18t 0x2bt
        0x75t 0x11t 0x53t 0x1ct
        0x7at 0xf8t 0x95t 0xet
        0x57t 0x67t 0xc5t 0x72t
        0x58t 0x8et 0x3t 0x60t
        0x49t 0xb5t 0x48t 0x57t
        0x46t 0x5ct 0x8et 0x45t
        0x3et 0x38t 0x2ft 0x7bt
        0x31t 0xd1t 0xe9t 0x69t
        0x20t 0xeat 0xa2t 0x5et
        0x2ft 0x3t 0x64t 0x4ct
        0x2t 0x9ct 0x34t 0x30t
        0xdt 0x75t 0xf2t 0x22t
        0x1ct 0x4et 0xb9t 0x15t
        0x13t 0xa7t 0x7ft 0x7t
        0xect 0x86t 0xfbt 0x68t
        0xe3t 0x6ft 0x3dt 0x7at
        0xf2t 0x54t 0x76t 0x4dt
        0xfdt 0xbdt 0xb0t 0x5ft
        0xd0t 0x22t 0xe0t 0x23t
        0xdft 0xcbt 0x26t 0x31t
        0xcet 0xf0t 0x6dt 0x6t
        0xc1t 0x19t 0xabt 0x14t
        0xb9t 0x7dt 0xat 0x2at
        0xb6t 0x94t 0xcct 0x38t
        0xa7t 0xaft 0x87t 0xft
        0xa8t 0x46t 0x41t 0x1dt
        0x85t 0xd9t 0x11t 0x61t
        0x8at 0x30t 0xd7t 0x73t
        0x9bt 0xbt 0x9ct 0x44t
        0x94t 0xe2t 0x5at 0x56t
        0x48t 0xfbt 0x52t 0x4ft
        0x47t 0x12t 0x94t 0x5dt
        0x56t 0x29t 0xdft 0x6at
        0x59t 0xc0t 0x19t 0x78t
        0x74t 0x5ft 0x49t 0x4t
        0x7bt 0xb6t 0x8ft 0x16t
        0x6at 0x8dt 0xc4t 0x21t
        0x65t 0x64t 0x2t 0x33t
        0x1dt 0x0t 0xa3t 0xdt
        0x12t 0xe9t 0x65t 0x1ft
        0x3t 0xd2t 0x2et 0x28t
        0xct 0x3bt 0xe8t 0x3at
        0x21t 0xa4t 0xb8t 0x46t
        0x2et 0x4dt 0x7et 0x54t
        0x3ft 0x76t 0x35t 0x63t
        0x30t 0x9ft 0xf3t 0x71t
        0xcft 0xbet 0x77t 0x1et
        0xc0t 0x57t 0xb1t 0xct
        0xd1t 0x6ct 0xfat 0x3bt
        0xdet 0x85t 0x3ct 0x29t
        0xf3t 0x1at 0x6ct 0x55t
        0xfct 0xf3t 0xaat 0x47t
        0xedt 0xc8t 0xe1t 0x70t
        0xe2t 0x21t 0x27t 0x62t
        0x9at 0x45t 0x86t 0x5ct
        0x95t 0xact 0x40t 0x4et
        0x84t 0x97t 0xbt 0x79t
        0x8bt 0x7et 0xcdt 0x6bt
        0xa6t 0xe1t 0x9dt 0x17t
        0xa9t 0x8t 0x5bt 0x5t
        0xb8t 0x33t 0x10t 0x32t
        0xb7t 0xdat 0xd6t 0x20t
        0xd6t 0x86t 0xbdt 0x73t
        0xd9t 0x6ft 0x7bt 0x61t
        0xc8t 0x54t 0x30t 0x56t
        0xc7t 0xbdt 0xf6t 0x44t
        0xeat 0x22t 0xa6t 0x38t
        0xe5t 0xcbt 0x60t 0x2at
        0xf4t 0xf0t 0x2bt 0x1dt
        0xfbt 0x19t 0xedt 0xft
        0x83t 0x7dt 0x4ct 0x31t
        0x8ct 0x94t 0x8at 0x23t
        0x9dt 0xaft 0xc1t 0x14t
        0x92t 0x46t 0x7t 0x6t
        0xbft 0xd9t 0x57t 0x7at
        0xb0t 0x30t 0x91t 0x68t
        0xa1t 0xbt 0xdat 0x5ft
        0xaet 0xe2t 0x1ct 0x4dt
        0x51t 0xc3t 0x98t 0x22t
        0x5et 0x2at 0x5et 0x30t
        0x4ft 0x11t 0x15t 0x7t
        0x40t 0xf8t 0xd3t 0x15t
        0x6dt 0x67t 0x83t 0x69t
        0x62t 0x8et 0x45t 0x7bt
        0x73t 0xb5t 0xet 0x4ct
        0x7ct 0x5ct 0xc8t 0x5et
        0x4t 0x38t 0x69t 0x60t
        0xbt 0xd1t 0xaft 0x72t
        0x1at 0xeat 0xe4t 0x45t
        0x15t 0x3t 0x22t 0x57t
        0x38t 0x9ct 0x72t 0x2bt
        0x37t 0x75t 0xb4t 0x39t
        0x26t 0x4et 0xfft 0xet
        0x29t 0xa7t 0x39t 0x1ct
        0xf5t 0xbet 0x31t 0x5t
        0xfat 0x57t 0xf7t 0x17t
        0xebt 0x6ct 0xbct 0x20t
        0xe4t 0x85t 0x7at 0x32t
        0xc9t 0x1at 0x2at 0x4et
        0xc6t 0xf3t 0xect 0x5ct
        0xd7t 0xc8t 0xa7t 0x6bt
        0xd8t 0x21t 0x61t 0x79t
        0xa0t 0x45t 0xc0t 0x47t
        0xaft 0xact 0x6t 0x55t
        0xbet 0x97t 0x4dt 0x62t
        0xb1t 0x7et 0x8bt 0x70t
        0x9ct 0xe1t 0xdbt 0xct
        0x93t 0x8t 0x1dt 0x1et
        0x82t 0x33t 0x56t 0x29t
        0x8dt 0xdat 0x90t 0x3bt
        0x72t 0xfbt 0x14t 0x54t
        0x7dt 0x12t 0xd2t 0x46t
        0x6ct 0x29t 0x99t 0x71t
        0x63t 0xc0t 0x5ft 0x63t
        0x4et 0x5ft 0xft 0x1ft
        0x41t 0xb6t 0xc9t 0xdt
        0x50t 0x8dt 0x82t 0x3at
        0x5ft 0x64t 0x44t 0x28t
        0x27t 0x0t 0xe5t 0x16t
        0x28t 0xe9t 0x23t 0x4t
        0x39t 0xd2t 0x68t 0x33t
        0x36t 0x3bt 0xaet 0x21t
        0x1bt 0xa4t 0xfet 0x5dt
        0x14t 0x4dt 0x38t 0x4ft
        0x5t 0x76t 0x73t 0x78t
        0xat 0x9ft 0xb5t 0x6at
        0xbdt 0x45t 0x63t 0x4at
        0xb2t 0xact 0xa5t 0x58t
        0xa3t 0x97t 0xeet 0x6ft
        0xact 0x7et 0x28t 0x7dt
        0x81t 0xe1t 0x78t 0x1t
        0x8et 0x8t 0xbet 0x13t
        0x9ft 0x33t 0xf5t 0x24t
        0x90t 0xdat 0x33t 0x36t
        0xe8t 0xbet 0x92t 0x8t
        0xe7t 0x57t 0x54t 0x1at
        0xf6t 0x6ct 0x1ft 0x2dt
        0xf9t 0x85t 0xd9t 0x3ft
        0xd4t 0x1at 0x89t 0x43t
        0xdbt 0xf3t 0x4ft 0x51t
        0xcat 0xc8t 0x4t 0x66t
        0xc5t 0x21t 0xc2t 0x74t
        0x3at 0x0t 0x46t 0x1bt
        0x35t 0xe9t 0x80t 0x9t
        0x24t 0xd2t 0xcbt 0x3et
        0x2bt 0x3bt 0xdt 0x2ct
        0x6t 0xa4t 0x5dt 0x50t
        0x9t 0x4dt 0x9bt 0x42t
        0x18t 0x76t 0xd0t 0x75t
        0x17t 0x9ft 0x16t 0x67t
        0x6ft 0xfbt 0xb7t 0x59t
        0x60t 0x12t 0x71t 0x4bt
        0x71t 0x29t 0x3at 0x7ct
        0x7et 0xc0t 0xfct 0x6et
        0x53t 0x5ft 0xact 0x12t
        0x5ct 0xb6t 0x6at 0x0t
        0x4dt 0x8dt 0x21t 0x37t
        0x42t 0x64t 0xe7t 0x25t
        0x9et 0x7dt 0xeft 0x3ct
        0x91t 0x94t 0x29t 0x2et
        0x80t 0xaft 0x62t 0x19t
        0x8ft 0x46t 0xa4t 0xbt
        0xa2t 0xd9t 0xf4t 0x77t
        0xadt 0x30t 0x32t 0x65t
        0xbct 0xbt 0x79t 0x52t
        0xb3t 0xe2t 0xbft 0x40t
        0xcbt 0x86t 0x1et 0x7et
        0xc4t 0x6ft 0xd8t 0x6ct
        0xd5t 0x54t 0x93t 0x5bt
        0xdat 0xbdt 0x55t 0x49t
        0xf7t 0x22t 0x5t 0x35t
        0xf8t 0xcbt 0xc3t 0x27t
        0xe9t 0xf0t 0x88t 0x10t
        0xe6t 0x19t 0x4et 0x2t
        0x19t 0x38t 0xcat 0x6dt
        0x16t 0xd1t 0xct 0x7ft
        0x7t 0xeat 0x47t 0x48t
        0x8t 0x3t 0x81t 0x5at
        0x25t 0x9ct 0xd1t 0x26t
        0x2at 0x75t 0x17t 0x34t
        0x3bt 0x4et 0x5ct 0x3t
        0x34t 0xa7t 0x9at 0x11t
        0x4ct 0xc3t 0x3bt 0x2ft
        0x43t 0x2at 0xfdt 0x3dt
        0x52t 0x11t 0xb6t 0xat
        0x5dt 0xf8t 0x70t 0x18t
        0x70t 0x67t 0x20t 0x64t
        0x7ft 0x8et 0xe6t 0x76t
        0x6et 0xb5t 0xadt 0x41t
        0x61t 0x5ct 0x6bt 0x53t
    .end array-data
.end method

.method public constructor <init>([B)V
    .locals 3
    .parameter "sourceBuffer"

    .prologue
    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->src:[B

    .line 135
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->src:[B

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->src:[B

    array-length v2, v2

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;-><init>([BI)V

    .line 140
    .local v0, scan:Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;
    iget-object v1, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->table:[I

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->table:[I

    .line 141
    iget v1, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->tableMask:I

    iput v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->tableMask:I

    .line 146
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->countEntries(Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    new-array v1, v1, [J

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->entries:[J

    .line 147
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->copyEntries(Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;)V

    .line 148
    return-void
.end method

.method private copyEntries(Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;)V
    .locals 7
    .parameter "scan"

    .prologue
    .line 180
    const/4 v2, 0x1

    .line 181
    .local v2, next:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->table:[I

    array-length v4, v4

    if-ge v1, v4, :cond_1

    .line 182
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->table:[I

    aget v0, v4, v1

    .line 183
    .local v0, h:I
    if-nez v0, :cond_0

    .line 181
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 186
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->table:[I

    aput v2, v4, v1

    .line 188
    :goto_2
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->entries:[J

    add-int/lit8 v3, v2, 0x1

    .end local v2           #next:I
    .local v3, next:I
    iget-object v5, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->entries:[J

    aget-wide v5, v5, v0

    aput-wide v5, v4, v2

    .line 189
    iget-object v4, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->next:[I

    aget v0, v4, v0

    .line 190
    if-nez v0, :cond_2

    move v2, v3

    .end local v3           #next:I
    .restart local v2       #next:I
    goto :goto_1

    .line 192
    .end local v0           #h:I
    :cond_1
    return-void

    .end local v2           #next:I
    .restart local v0       #h:I
    .restart local v3       #next:I
    :cond_2
    move v2, v3

    .end local v3           #next:I
    .restart local v2       #next:I
    goto :goto_2
.end method

.method private countEntries(Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;)I
    .locals 6
    .parameter "scan"

    .prologue
    .line 156
    const/4 v0, 0x0

    .line 157
    .local v0, cnt:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->table:[I

    array-length v4, v4

    if-ge v2, v4, :cond_3

    .line 158
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->table:[I

    aget v1, v4, v2

    .line 159
    .local v1, h:I
    if-nez v1, :cond_0

    .line 157
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 162
    :cond_0
    const/4 v3, 0x0

    .line 164
    .local v3, len:I
    :cond_1
    add-int/lit8 v3, v3, 0x1

    const/16 v4, 0x40

    if-ne v3, v4, :cond_2

    .line 165
    iget-object v4, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->next:[I

    const/4 v5, 0x0

    aput v5, v4, v1

    .line 170
    :goto_2
    add-int/2addr v0, v3

    goto :goto_1

    .line 168
    :cond_2
    iget-object v4, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndexScanner;->next:[I

    aget v1, v4, v1

    .line 169
    if-nez v1, :cond_1

    goto :goto_2

    .line 172
    .end local v1           #h:I
    .end local v3           #len:I
    :cond_3
    return v0
.end method

.method public static estimateIndexSize(I)J
    .locals 2
    .parameter "sourceLength"

    .prologue
    .line 83
    mul-int/lit8 v0, p0, 0x3

    div-int/lit8 v0, v0, 0x4

    add-int/2addr v0, p0

    int-to-long v0, v0

    return-wide v0
.end method

.method private static fwdmatch([BI[BI)I
    .locals 3
    .parameter "res"
    .parameter "resPtr"
    .parameter "src"
    .parameter "srcPtr"

    .prologue
    .line 399
    move v0, p1

    .line 400
    .local v0, start:I
    :goto_0
    array-length v1, p0

    if-ge p1, v1, :cond_0

    array-length v1, p2

    if-ge p3, v1, :cond_0

    .line 401
    aget-byte v1, p0, p1

    aget-byte v2, p2, p3

    if-eq v1, v2, :cond_1

    .line 404
    :cond_0
    sub-int v1, p1, v0

    return v1

    .line 400
    :cond_1
    add-int/lit8 p1, p1, 0x1

    add-int/lit8 p3, p3, 0x1

    goto :goto_0
.end method

.method static hashBlock([BI)I
    .locals 4
    .parameter "raw"
    .parameter "ptr"

    .prologue
    .line 445
    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v1, v2

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v1, v2

    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int v0, v1, v2

    .line 449
    .local v0, hash:I
    sget-object v1, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->T:[I

    ushr-int/lit8 v2, v0, 0x1f

    aget v1, v1, v2

    xor-int/2addr v0, v1

    .line 451
    shl-int/lit8 v1, v0, 0x8

    add-int/lit8 v2, p1, 0x4

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->T:[I

    ushr-int/lit8 v3, v0, 0x17

    aget v2, v2, v3

    xor-int v0, v1, v2

    .line 452
    shl-int/lit8 v1, v0, 0x8

    add-int/lit8 v2, p1, 0x5

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->T:[I

    ushr-int/lit8 v3, v0, 0x17

    aget v2, v2, v3

    xor-int v0, v1, v2

    .line 453
    shl-int/lit8 v1, v0, 0x8

    add-int/lit8 v2, p1, 0x6

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->T:[I

    ushr-int/lit8 v3, v0, 0x17

    aget v2, v2, v3

    xor-int v0, v1, v2

    .line 454
    shl-int/lit8 v1, v0, 0x8

    add-int/lit8 v2, p1, 0x7

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->T:[I

    ushr-int/lit8 v3, v0, 0x17

    aget v2, v2, v3

    xor-int v0, v1, v2

    .line 456
    shl-int/lit8 v1, v0, 0x8

    add-int/lit8 v2, p1, 0x8

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->T:[I

    ushr-int/lit8 v3, v0, 0x17

    aget v2, v2, v3

    xor-int v0, v1, v2

    .line 457
    shl-int/lit8 v1, v0, 0x8

    add-int/lit8 v2, p1, 0x9

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->T:[I

    ushr-int/lit8 v3, v0, 0x17

    aget v2, v2, v3

    xor-int v0, v1, v2

    .line 458
    shl-int/lit8 v1, v0, 0x8

    add-int/lit8 v2, p1, 0xa

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->T:[I

    ushr-int/lit8 v3, v0, 0x17

    aget v2, v2, v3

    xor-int v0, v1, v2

    .line 459
    shl-int/lit8 v1, v0, 0x8

    add-int/lit8 v2, p1, 0xb

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->T:[I

    ushr-int/lit8 v3, v0, 0x17

    aget v2, v2, v3

    xor-int v0, v1, v2

    .line 461
    shl-int/lit8 v1, v0, 0x8

    add-int/lit8 v2, p1, 0xc

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->T:[I

    ushr-int/lit8 v3, v0, 0x17

    aget v2, v2, v3

    xor-int v0, v1, v2

    .line 462
    shl-int/lit8 v1, v0, 0x8

    add-int/lit8 v2, p1, 0xd

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->T:[I

    ushr-int/lit8 v3, v0, 0x17

    aget v2, v2, v3

    xor-int v0, v1, v2

    .line 463
    shl-int/lit8 v1, v0, 0x8

    add-int/lit8 v2, p1, 0xe

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->T:[I

    ushr-int/lit8 v3, v0, 0x17

    aget v2, v2, v3

    xor-int v0, v1, v2

    .line 464
    shl-int/lit8 v1, v0, 0x8

    add-int/lit8 v2, p1, 0xf

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->T:[I

    ushr-int/lit8 v3, v0, 0x17

    aget v2, v2, v3

    xor-int v0, v1, v2

    .line 466
    return v0
.end method

.method private static keyOf(J)I
    .locals 2
    .parameter "ent"

    .prologue
    .line 475
    const/16 v0, 0x20

    ushr-long v0, p0, v0

    long-to-int v0, v0

    return v0
.end method

.method private static negmatch([BI[BII)I
    .locals 3
    .parameter "res"
    .parameter "resPtr"
    .parameter "src"
    .parameter "srcPtr"
    .parameter "limit"

    .prologue
    .line 409
    if-nez p3, :cond_0

    .line 410
    const/4 v1, 0x0

    .line 421
    :goto_0
    return v1

    .line 412
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 413
    add-int/lit8 p3, p3, -0x1

    .line 414
    move v0, p1

    .line 416
    .local v0, start:I
    :cond_1
    aget-byte v1, p0, p1

    aget-byte v2, p2, p3

    if-eq v1, v2, :cond_3

    .line 421
    :cond_2
    :goto_1
    sub-int v1, v0, p1

    goto :goto_0

    .line 418
    :cond_3
    add-int/lit8 p1, p1, -0x1

    .line 419
    add-int/lit8 p3, p3, -0x1

    .line 420
    if-ltz p3, :cond_2

    add-int/lit8 p4, p4, -0x1

    if-gtz p4, :cond_1

    goto :goto_1
.end method

.method private newEncoder(Ljava/io/OutputStream;JI)Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;
    .locals 7
    .parameter "out"
    .parameter "resSize"
    .parameter "limit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 395
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->getSourceSize()J

    move-result-wide v2

    move-object v1, p1

    move-wide v4, p2

    move v6, p4

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;-><init>(Ljava/io/OutputStream;JJI)V

    return-object v0
.end method

.method private static sizeOf([B)J
    .locals 2
    .parameter "b"

    .prologue
    .line 217
    const/4 v0, 0x1

    array-length v1, p0

    invoke-static {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->sizeOfArray(II)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method private static sizeOf([I)J
    .locals 2
    .parameter "b"

    .prologue
    .line 221
    const/4 v0, 0x4

    array-length v1, p0

    invoke-static {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->sizeOfArray(II)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method private static sizeOf([J)J
    .locals 2
    .parameter "b"

    .prologue
    .line 225
    const/16 v0, 0x8

    array-length v1, p0

    invoke-static {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->sizeOfArray(II)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method private static sizeOfArray(II)I
    .locals 1
    .parameter "entSize"
    .parameter "len"

    .prologue
    .line 229
    mul-int v0, p1, p0

    add-int/lit8 v0, v0, 0xc

    return v0
.end method

.method private static step(IBB)I
    .locals 3
    .parameter "hash"
    .parameter "toRemove"
    .parameter "toAdd"

    .prologue
    .line 470
    sget-object v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->U:[I

    and-int/lit16 v1, p1, 0xff

    aget v0, v0, v1

    xor-int/2addr p0, v0

    .line 471
    shl-int/lit8 v0, p0, 0x8

    and-int/lit16 v1, p2, 0xff

    or-int/2addr v0, v1

    sget-object v1, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->T:[I

    ushr-int/lit8 v2, p0, 0x17

    aget v1, v1, v2

    xor-int/2addr v0, v1

    return v0
.end method

.method private static valOf(J)I
    .locals 1
    .parameter "ent"

    .prologue
    .line 479
    long-to-int v0, p0

    return v0
.end method


# virtual methods
.method public encode(Ljava/io/OutputStream;[B)V
    .locals 1
    .parameter "out"
    .parameter "res"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 251
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->encode(Ljava/io/OutputStream;[BI)Z

    .line 252
    return-void
.end method

.method public encode(Ljava/io/OutputStream;[BI)Z
    .locals 26
    .parameter "out"
    .parameter "res"
    .parameter "deltaSizeLimit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 282
    move-object/from16 v0, p2

    array-length v14, v0

    .line 283
    .local v14, end:I
    int-to-long v0, v14

    move-wide/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-wide/from16 v2, v24

    move/from16 v4, p3

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->newEncoder(Ljava/io/OutputStream;JI)Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;

    move-result-object v13

    .line 290
    .local v13, enc:Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;
    const/16 v24, 0x10

    move/from16 v0, v24

    if-lt v14, v0, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->table:[I

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    if-nez v24, :cond_1

    .line 291
    :cond_0
    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->insert([B)Z

    move-result v24

    .line 390
    :goto_0
    return v24

    .line 296
    :cond_1
    const/4 v10, 0x0

    .line 297
    .local v10, blkPtr:I
    const/16 v8, 0x10

    .line 298
    .local v8, blkEnd:I
    const/16 v24, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v24

    invoke-static {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->hashBlock([BI)I

    move-result v19

    .line 300
    .local v19, hash:I
    const/16 v22, 0x0

    .local v22, resPtr:I
    move v9, v8

    .end local v8           #blkEnd:I
    .local v9, blkEnd:I
    move v11, v10

    .line 301
    .end local v10           #blkPtr:I
    .local v11, blkPtr:I
    :goto_1
    if-ge v9, v14, :cond_d

    .line 302
    move-object/from16 v0, p0

    iget v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->tableMask:I

    move/from16 v24, v0

    and-int v23, v19, v24

    .line 303
    .local v23, tableIdx:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->table:[I

    move-object/from16 v24, v0

    aget v17, v24, v23

    .line 304
    .local v17, entryIdx:I
    if-nez v17, :cond_2

    .line 307
    add-int/lit8 v10, v11, 0x1

    .end local v11           #blkPtr:I
    .restart local v10       #blkPtr:I
    aget-byte v24, p2, v11

    add-int/lit8 v8, v9, 0x1

    .end local v9           #blkEnd:I
    .restart local v8       #blkEnd:I
    aget-byte v25, p2, v9

    move/from16 v0, v19

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->step(IBB)I

    move-result v19

    move v9, v8

    .end local v8           #blkEnd:I
    .restart local v9       #blkEnd:I
    move v11, v10

    .line 308
    .end local v10           #blkPtr:I
    .restart local v11       #blkPtr:I
    goto :goto_1

    .line 314
    :cond_2
    const/4 v5, -0x1

    .line 315
    .local v5, bestLen:I
    const/4 v7, -0x1

    .line 316
    .local v7, bestPtr:I
    const/4 v6, 0x0

    .line 318
    .local v6, bestNeg:I
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->entries:[J

    move-object/from16 v24, v0

    add-int/lit8 v18, v17, 0x1

    .end local v17           #entryIdx:I
    .local v18, entryIdx:I
    aget-wide v15, v24, v17

    .line 319
    .local v15, ent:J
    invoke-static/range {v15 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->keyOf(J)I

    move-result v24

    move/from16 v0, v24

    move/from16 v1, v19

    if-ne v0, v1, :cond_6

    .line 320
    const/16 v21, 0x0

    .line 321
    .local v21, neg:I
    move/from16 v0, v22

    if-ge v0, v11, :cond_3

    .line 329
    sub-int v21, v11, v22

    .line 330
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->src:[B

    move-object/from16 v24, v0

    invoke-static/range {v15 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->valOf(J)I

    move-result v25

    move-object/from16 v0, p2

    move-object/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v21

    invoke-static {v0, v11, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->negmatch([BI[BII)I

    move-result v21

    .line 333
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->src:[B

    move-object/from16 v24, v0

    invoke-static/range {v15 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->valOf(J)I

    move-result v25

    move-object/from16 v0, p2

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-static {v0, v11, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->fwdmatch([BI[BI)I

    move-result v24

    add-int v20, v21, v24

    .line 334
    .local v20, len:I
    move/from16 v0, v20

    if-ge v5, v0, :cond_4

    .line 335
    move/from16 v5, v20

    .line 336
    invoke-static/range {v15 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->valOf(J)I

    move-result v7

    .line 337
    move/from16 v6, v21

    .line 341
    .end local v20           #len:I
    .end local v21           #neg:I
    :cond_4
    const/16 v24, 0x1000

    move/from16 v0, v24

    if-ge v5, v0, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->entries:[J

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    move/from16 v0, v18

    move/from16 v1, v24

    if-lt v0, v1, :cond_c

    .line 343
    :cond_5
    :goto_3
    const/16 v24, 0x10

    move/from16 v0, v24

    if-ge v5, v0, :cond_7

    .line 349
    add-int/lit8 v10, v11, 0x1

    .end local v11           #blkPtr:I
    .restart local v10       #blkPtr:I
    aget-byte v24, p2, v11

    add-int/lit8 v8, v9, 0x1

    .end local v9           #blkEnd:I
    .restart local v8       #blkEnd:I
    aget-byte v25, p2, v9

    move/from16 v0, v19

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->step(IBB)I

    move-result v19

    move v9, v8

    .end local v8           #blkEnd:I
    .restart local v9       #blkEnd:I
    move v11, v10

    .line 350
    .end local v10           #blkPtr:I
    .restart local v11       #blkPtr:I
    goto/16 :goto_1

    .line 339
    :cond_6
    invoke-static/range {v15 .. v16}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->keyOf(J)I

    move-result v24

    move-object/from16 v0, p0

    iget v0, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->tableMask:I

    move/from16 v25, v0

    and-int v24, v24, v25

    move/from16 v0, v24

    move/from16 v1, v23

    if-eq v0, v1, :cond_4

    goto :goto_3

    .line 353
    :cond_7
    sub-int v10, v11, v6

    .line 355
    .end local v11           #blkPtr:I
    .restart local v10       #blkPtr:I
    move/from16 v0, v22

    if-ge v0, v10, :cond_8

    .line 361
    sub-int v12, v10, v22

    .line 362
    .local v12, cnt:I
    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v13, v0, v1, v12}, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->insert([BII)Z

    move-result v24

    if-nez v24, :cond_8

    .line 363
    const/16 v24, 0x0

    goto/16 :goto_0

    .line 366
    .end local v12           #cnt:I
    :cond_8
    sub-int v24, v7, v6

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    invoke-virtual {v13, v0, v1, v5}, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->copy(JI)Z

    move-result v24

    if-nez v24, :cond_9

    .line 367
    const/16 v24, 0x0

    goto/16 :goto_0

    .line 369
    :cond_9
    add-int/2addr v10, v5

    .line 370
    move/from16 v22, v10

    .line 371
    add-int/lit8 v8, v10, 0x10

    .line 375
    .end local v9           #blkEnd:I
    .restart local v8       #blkEnd:I
    if-gt v14, v8, :cond_a

    .line 383
    .end local v5           #bestLen:I
    .end local v6           #bestNeg:I
    .end local v7           #bestPtr:I
    .end local v15           #ent:J
    .end local v18           #entryIdx:I
    .end local v23           #tableIdx:I
    :goto_4
    move/from16 v0, v22

    if-ge v0, v14, :cond_b

    .line 387
    sub-int v12, v14, v22

    .line 388
    .restart local v12       #cnt:I
    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v13, v0, v1, v12}, Lorg/eclipse/jgit/internal/storage/pack/DeltaEncoder;->insert([BII)Z

    move-result v24

    goto/16 :goto_0

    .line 380
    .end local v12           #cnt:I
    .restart local v5       #bestLen:I
    .restart local v6       #bestNeg:I
    .restart local v7       #bestPtr:I
    .restart local v15       #ent:J
    .restart local v18       #entryIdx:I
    .restart local v23       #tableIdx:I
    :cond_a
    move-object/from16 v0, p2

    invoke-static {v0, v10}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->hashBlock([BI)I

    move-result v19

    move v9, v8

    .end local v8           #blkEnd:I
    .restart local v9       #blkEnd:I
    move v11, v10

    .line 381
    .end local v10           #blkPtr:I
    .restart local v11       #blkPtr:I
    goto/16 :goto_1

    .line 390
    .end local v5           #bestLen:I
    .end local v6           #bestNeg:I
    .end local v7           #bestPtr:I
    .end local v9           #blkEnd:I
    .end local v11           #blkPtr:I
    .end local v15           #ent:J
    .end local v18           #entryIdx:I
    .end local v23           #tableIdx:I
    .restart local v8       #blkEnd:I
    .restart local v10       #blkPtr:I
    :cond_b
    const/16 v24, 0x1

    goto/16 :goto_0

    .end local v8           #blkEnd:I
    .end local v10           #blkPtr:I
    .restart local v5       #bestLen:I
    .restart local v6       #bestNeg:I
    .restart local v7       #bestPtr:I
    .restart local v9       #blkEnd:I
    .restart local v11       #blkPtr:I
    .restart local v15       #ent:J
    .restart local v18       #entryIdx:I
    .restart local v23       #tableIdx:I
    :cond_c
    move/from16 v17, v18

    .end local v18           #entryIdx:I
    .restart local v17       #entryIdx:I
    goto/16 :goto_2

    .end local v5           #bestLen:I
    .end local v6           #bestNeg:I
    .end local v7           #bestPtr:I
    .end local v15           #ent:J
    .end local v17           #entryIdx:I
    .end local v23           #tableIdx:I
    :cond_d
    move v8, v9

    .end local v9           #blkEnd:I
    .restart local v8       #blkEnd:I
    move v10, v11

    .end local v11           #blkPtr:I
    .restart local v10       #blkPtr:I
    goto :goto_4
.end method

.method public getIndexSize()J
    .locals 4

    .prologue
    .line 208
    const-wide/16 v0, 0x8

    .line 209
    .local v0, sz:J
    const-wide/16 v2, 0x10

    add-long/2addr v0, v2

    .line 210
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->src:[B

    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->sizeOf([B)J

    move-result-wide v2

    add-long/2addr v0, v2

    .line 211
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->table:[I

    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->sizeOf([I)J

    move-result-wide v2

    add-long/2addr v0, v2

    .line 212
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->entries:[J

    invoke-static {v2}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->sizeOf([J)J

    move-result-wide v2

    add-long/2addr v0, v2

    .line 213
    return-wide v0
.end method

.method public getSourceSize()J
    .locals 2

    .prologue
    .line 196
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->src:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    .prologue
    const-wide/16 v7, 0x400

    .line 426
    const/4 v5, 0x4

    new-array v4, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "bytes"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "KiB"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "MiB"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "GiB"

    aput-object v6, v4, v5

    .line 427
    .local v4, units:[Ljava/lang/String;
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaIndex;->getIndexSize()J

    move-result-wide v1

    .line 428
    .local v1, sz:J
    const/4 v3, 0x0

    .line 429
    .local v3, u:I
    :goto_0
    cmp-long v5, v7, v1

    if-gtz v5, :cond_1

    array-length v5, v4

    add-int/lit8 v5, v5, -0x1

    if-ge v3, v5, :cond_1

    .line 430
    rem-long v5, v1, v7

    long-to-int v0, v5

    .line 431
    .local v0, rem:I
    div-long/2addr v1, v7

    .line 432
    if-eqz v0, :cond_0

    .line 433
    const-wide/16 v5, 0x1

    add-long/2addr v1, v5

    .line 434
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 435
    goto :goto_0

    .line 436
    .end local v0           #rem:I
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "DeltaIndex["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v4, v3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method
