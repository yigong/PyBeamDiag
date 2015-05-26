#matplotlib.rcParams["figure.figsize"] = []
binsPB = np.arange(-20,20.5,0.5)
figPB, axPB = plt.subplots(figsize=[8,6])
figPB.subplots_adjust(bottom=0.15, left=0.14)
a = axPB.hist(edataAfterEnergy.back_projection, bins=binsPB, histtype='stepfilled',\
         align='left',color='b')
#axPB.legend()
axPB.set_xlim(-20.25, 20.25)
YLIM = 180
#axPB.set_ylim(0, YLIM)
axPB.set_xlabel('Initial electron position (mm)')
axPB.set_ylabel('Counts')
axPB.get_xaxis().set_major_locator(MaxNLocator(integer=True))
axPB.set_xticks([-20,-10,-5,-0,5,10,20])
axPB.vlines([-1.75, 1.75], 0, YLIM, color='r',lw=2)
figPB.show()